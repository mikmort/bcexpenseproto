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
                Enabled = Rec.Status = 'Draft';

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
                    Rec.Status := 'Submitted';
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
                Enabled = Rec.Status = 'Draft';

                trigger OnAction()
                var
                    ExpenseReportLine: Record "Expense Report Lines";
                    ExpenseReportLineCard: Page "Expense Report Line Card";
                begin
                    ExpenseReportLine.Init();
                    ExpenseReportLine."Report Id" := Rec."Report Id";
                    ExpenseReportLine."Line Number" := GetNextLineNumber();
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
        Rec."Report Date" := Today();
        Rec."Posting Date" := Today();
        Rec."Created Date Time" := CurrentDateTime();
        Rec."Created By" := UserId();
        Rec.Status := 'Draft';

        // Set default currency if available
        if Rec."Currency Code" = '' then
            Rec."Currency Code" := GetDefaultCurrencyCode();
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
}


