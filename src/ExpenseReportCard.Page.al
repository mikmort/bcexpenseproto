page 50153 "Expense Report Card"
{
    PageType = Card;
    SourceTable = "Expense Reports";
    ApplicationArea = All;
    UsageCategory = Documents;
    Caption = 'Expense Report Card';

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';

                field("Report Id"; Rec."Report Id")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the unique identifier for the expense report.';

                    trigger OnAssistEdit()
                    begin
                        if Rec.AssistEdit(xRec) then
                            CurrPage.Update();
                    end;
                }
                field("Employee Id"; Rec."Employee Id")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the employee who created this expense report.';
                }
                field(Purpose; Rec.Purpose)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the business purpose of the expense report.';
                }
                field(Destination; Rec.Destination)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the destination of the business trip or expense.';
                }
                field("Report Date"; Rec."Report Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the date the expense report was created.';
                }
                field("Posting Date"; Rec."Posting Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the date the expense report will be posted.';
                }
                field("Currency Code"; Rec."Currency Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the currency code for the expense report.';
                }
                field("Total Amount"; Rec."Total Amount")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the total amount of all expenses in this report.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the current status of the expense report.';
                }
                field("Payment Method Code"; Rec."Payment Method Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the payment method for reimbursement.';
                }
                field("Pre Approval Number"; Rec."Pre Approval Number")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the pre-approval number if applicable.';
                }
                field("Receipts Attached"; Rec."Receipts Attached")
                {
                    ApplicationArea = All;
                    ToolTip = 'Indicates whether receipts are attached to this report.';
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies who created this expense report.';
                    Editable = false;
                }
                field("Created Date Time"; Rec."Created Date Time")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies when this expense report was created.';
                    Editable = false;
                }
                field("Modified Date Time"; Rec."Modified Date Time")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies when this expense report was last modified.';
                    Editable = false;
                }
            }

            part(ExpenseLines; "Expense Report Lines Part")
            {
                ApplicationArea = All;
                Caption = 'Expense Lines';
                SubPageLink = "Report Id" = field("Report Id");
                UpdatePropagation = Both;
            }
        }
        area(factboxes)
        {
            part(ExpenseSummary; "Expense Report Summary FactBox")
            {
                ApplicationArea = All;
                Caption = 'Summary';
                SubPageLink = "Report Id" = field("Report Id");
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(SubmitReport)
            {
                ApplicationArea = All;
                Caption = 'Submit Report';
                Image = SendTo;
                ToolTip = 'Submit the expense report for approval.';
                Enabled = Rec.Status = "Expense Status"::Draft;

                trigger OnAction()
                var
                    ExpenseReportLines: Record "Expense Report Lines";
                begin
                    // Validate that report has lines
                    ExpenseReportLines.SetRange("Report Id", Rec."Report Id");
                    if ExpenseReportLines.IsEmpty then begin
                        Error('Cannot submit an expense report without expense lines.');
                        exit;
                    end;

                    // Update status and submit
                    Rec.Status := "Expense Status"::Submitted;
                    Rec.Modify(true);
                    CurrPage.Update(false);
                    Message('Report submitted for approval.');
                end;
            }
            action(AddExpenseLine)
            {
                ApplicationArea = All;
                Caption = 'Add Expense Line';
                Image = NewItem;
                ToolTip = 'Add a new expense line to this report.';
                Enabled = Rec.Status = "Expense Status"::Draft;

                trigger OnAction()
                var
                    ExpenseReportLine: Record "Expense Report Lines";
                    ExpenseReportLineCard: Page "Expense Report Line Card";
                begin
                    ExpenseReportLine.Init();
                    ExpenseReportLine."Report Id" := Rec."Report Id";
                    ExpenseReportLine."Line Number" := GetNextLineNumber();

                    // Set smart defaults for new expense line
                    ExpenseReportLine."Expense Date" := GetValidDateForEntry();
                    ExpenseReportLine."Currency Code" := Rec."Currency Code";
                    ExpenseReportLine."Payment Method Code" := Rec."Payment Method Code";
                    ExpenseReportLine.Status := "Expense Status"::Draft;
                    ExpenseReportLine."Receipt Required" := true; // Default to requiring receipt

                    ExpenseReportLine.Insert(true);

                    ExpenseReportLineCard.SetRecord(ExpenseReportLine);
                    if ExpenseReportLineCard.RunModal() = Action::OK then begin
                        CurrPage.ExpenseLines.Page.Update(false);
                        CurrPage.ExpenseSummary.Page.Update(false);
                    end;
                end;
            }
            action(CalculateTotals)
            {
                ApplicationArea = All;
                Caption = 'Calculate Totals';
                Image = Calculate;
                ToolTip = 'Recalculate the total amount from all expense lines.';

                trigger OnAction()
                begin
                    CalculateReportTotals();
                    CurrPage.Update(false);
                    Message('Totals have been recalculated.');
                end;
            }
            action(PrintReport)
            {
                ApplicationArea = All;
                Caption = 'Print Report';
                Image = Print;
                ToolTip = 'Print the expense report.';

                trigger OnAction()
                begin
                    // Implementation for printing report
                    Message('Printing expense report.');
                end;
            }
        }
        area(Navigation)
        {
            action(ViewExpenseLines)
            {
                ApplicationArea = All;
                Caption = 'View All Expense Lines';
                Image = Line;
                RunObject = page "Expense Report Lines List";
                RunPageLink = "Report Id" = field("Report Id");
                ToolTip = 'View all expense lines in a separate page.';
            }
        }
    }

    var
        SubmissionInProgress: Boolean;

    trigger OnAfterGetRecord()
    begin
        SubmissionInProgress := (Rec.Status = "Expense Status"::Submitted);
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        // Set smart default dates that comply with license restrictions
        Rec."Report Date" := GetValidDateForEntry();
        Rec."Posting Date" := GetValidDateForEntry();

        // Set audit fields
        Rec."Created Date Time" := CurrentDateTime();
        Rec."Created By" := UserId();
        Rec.Status := "Expense Status"::Draft;

        // Try to auto-generate Report ID using number series
        if Rec."Report Id" = '' then begin
            if Rec.AssistEdit(xRec) then
                CurrPage.Update()
            else begin
                // Fallback: Generate a simple ID if number series fails
                Rec."Report Id" := GenerateFallbackReportId();
            end;
        end;

        // Set default employee (try to find current user's employee record)
        if Rec."Employee Id" = '' then
            Rec."Employee Id" := GetCurrentEmployeeId();

        // Set default currency (employee's default or system default)
        if Rec."Currency Code" = '' then
            Rec."Currency Code" := GetDefaultCurrencyForEmployee(Rec."Employee Id");

        // Set default payment method
        if Rec."Payment Method Code" = '' then
            Rec."Payment Method Code" := GetDefaultPaymentMethod();

        // Initialize other defaults
        Rec."Receipts Attached" := false;
        Rec."Total Amount" := 0;
    end;

    trigger OnModifyRecord(): Boolean
    begin
        Rec."Modified Date Time" := CurrentDateTime();
    end;

    local procedure GetNextLineNumber(): Integer
    var
        ExpenseReportLine: Record "Expense Report Lines";
        MaxLineNo: Integer;
    begin
        ExpenseReportLine.SetRange("Report Id", Rec."Report Id");
        if ExpenseReportLine.FindLast() then
            MaxLineNo := ExpenseReportLine."Line Number";

        exit(MaxLineNo + 1000);
    end;

    local procedure CalculateReportTotals()
    var
        ExpenseReportLine: Record "Expense Report Lines";
        TotalAmount: Decimal;
    begin
        TotalAmount := 0;
        ExpenseReportLine.SetRange("Report Id", Rec."Report Id");
        if ExpenseReportLine.FindSet() then begin
            repeat
                TotalAmount += ExpenseReportLine."Reimbursable Amount";
            until ExpenseReportLine.Next() = 0;
        end;

        Rec."Total Amount" := TotalAmount;
        Rec.Modify(true);
    end;

    local procedure GetDefaultCurrencyCode(): Code[3]
    var
        GeneralLedgerSetup: Record "General Ledger Setup";
    begin
        if GeneralLedgerSetup.Get() then
            exit(GeneralLedgerSetup."LCY Code");

        exit('');
    end;

    local procedure GetCurrentEmployeeId(): Code[20]
    var
        Employee: Record Employees;
        UserSetup: Record "User Setup";
        CurrentUserEmail: Text[250];
    begin
        // Try to find employee by email using User Setup
        if UserSetup.Get(UserId()) then begin
            CurrentUserEmail := UserSetup."E-Mail";
            if CurrentUserEmail <> '' then begin
                Employee.SetRange(Email, CurrentUserEmail);
                if Employee.FindFirst() then
                    exit(Employee."Employee Id");
            end;
        end;

        // Alternative: Try to find employee where email contains the current user ID
        // This is useful if the user ID is based on email prefix
        Employee.Reset();
        Employee.SetFilter(Email, '*' + UserId() + '*');
        if Employee.FindFirst() then
            exit(Employee."Employee Id");

        // Return empty if no employee found - user will need to select manually
        exit('');
    end;

    local procedure GetDefaultCurrencyForEmployee(EmployeeId: Code[20]): Code[3]
    var
        Employee: Record Employees;
    begin
        // If employee is specified, use their default currency
        if (EmployeeId <> '') and Employee.Get(EmployeeId) and (Employee."Default Currency" <> '') then
            exit(Employee."Default Currency");

        // Fall back to system default currency
        exit(GetDefaultCurrencyCode());
    end;

    local procedure GetDefaultPaymentMethod(): Code[10]
    var
        PaymentMethod: Record "Payment Methods";
    begin
        // Try to find a common default payment method
        if PaymentMethod.Get('PERSONAL') then
            exit('PERSONAL');

        if PaymentMethod.Get('CORP-CARD') then
            exit('CORP-CARD');

        // If no standard methods found, get the first available
        PaymentMethod.Reset();
        if PaymentMethod.FindFirst() then
            exit(PaymentMethod."Payment Method Code");

        exit('');
    end;

    local procedure GetValidDateForEntry(): Date
    var
        TargetDate: Date;
        TargetMonth: Integer;
    begin
        // Start with today's date
        TargetDate := Today();
        TargetMonth := Date2DMY(TargetDate, 2);

        // Check if current month is allowed (11, 12, 01, 02)
        if TargetMonth in [1, 2, 11, 12] then
            exit(TargetDate);

        // If current date is not in allowed range, use February 15 of current year
        // This provides a reasonable default for data entry
        exit(DMY2Date(15, 2, Date2DMY(TargetDate, 3)));
    end;

    local procedure GenerateFallbackReportId(): Code[30]
    var
        ExpenseReport: Record "Expense Reports";
        CurrentDate: Date;
        Year: Integer;
        Month: Integer;
        Day: Integer;
        Counter: Integer;
        ProposedId: Code[30];
    begin
        // Generate a fallback ID in format EXP-YYYY-MM-DD-NNN
        CurrentDate := Today();
        Year := Date2DMY(CurrentDate, 3);
        Month := Date2DMY(CurrentDate, 2);
        Day := Date2DMY(CurrentDate, 1);

        // Find next available number
        Counter := 1;
        repeat
            ProposedId := 'EXP-' + Format(Year, 4, '<Integer,4><Filler Character,0>') + '-' +
                         Format(Month, 2, '<Integer,2><Filler Character,0>') + '-' +
                         Format(Day, 2, '<Integer,2><Filler Character,0>') + '-' +
                         Format(Counter, 3, '<Integer,3><Filler Character,0>');

            ExpenseReport.SetRange("Report Id", ProposedId);
            if ExpenseReport.IsEmpty() then
                exit(ProposedId);

            Counter += 1;
        until Counter > 999;

        // Final fallback - use timestamp
        exit('EXP-' + Format(CurrentDateTime(), 0, '<Year4>-<Month,2>-<Day,2>-<Hours24,2><Minutes,2>'));
    end;
}


