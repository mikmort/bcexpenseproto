page 50171 "My Expense Reports List"
{
    PageType = List;
    SourceTable = "Expense Reports";
    ApplicationArea = All;
    UsageCategory = Lists;
    Caption = 'My Expense Reports';
    Editable = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    DeleteAllowed = false;
    PromotedActionCategories = 'New,Process,Report,Category4,Filter';

    layout
    {
        area(content)
        {
            repeater(Group)
            {

                field(Status; Rec.Status)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the current status of the expense report.';
                    StyleExpr = StatusStyleExpr;
                    Style = Strong;
                }
                field("Report Id"; Rec."Report Id")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the unique identifier for the expense report.';
                }
                field("Employee Id"; Rec."Employee Id")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the employee who owns this expense report.';
                }
                field(Purpose; Rec.Purpose)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the purpose or reason for the expense report.';
                }
                field(Destination; Rec.Destination)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the destination for the business trip or expense.';
                }
                field("Report Date"; Rec."Report Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the date of the expense report.';
                }
                field("Total Amount"; Rec."Total Amount")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the total amount of the expense report.';
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies who created this expense report.';
                }
                field("Created Date Time"; Rec."Created Date Time")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies when this expense report was created.';
                }
            }
        }

        area(factboxes)
        {
            part(ExpenseReportSummary; "Expense Report Summary FactBox")
            {
                ApplicationArea = All;
                SubPageLink = "Report Id" = FIELD("Report Id");
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("New Expense Report")
            {
                ApplicationArea = All;
                Caption = 'New Expense Report';
                Image = New;
                Promoted = true;
                PromotedCategory = New;
                PromotedIsBig = true;
                ToolTip = 'Create a new expense report';

                trigger OnAction()
                var
                    ExpenseReport: Record "Expense Reports";
                    ExpenseReportCard: Page "Expense Report Card";
                begin
                    Clear(ExpenseReport);
                    ExpenseReport.Init();
                    if ExpenseReport.Insert(true) then begin
                        if not ExpenseReport.Get(ExpenseReport."Report Id") then
                            exit;

                        ExpenseReportCard.SetRecord(ExpenseReport);
                        ExpenseReportCard.Run();
                        CurrPage.Update(false);
                    end;
                end;
            }

            action("View Details")
            {
                ApplicationArea = All;
                Caption = 'View Details';
                Image = View;
                Promoted = true;
                PromotedCategory = Process;
                ToolTip = 'View detailed information about the selected expense report';

                trigger OnAction()
                var
                    ExpenseReportCard: Page "Expense Report Card";
                begin
                    ExpenseReportCard.SetRecord(Rec);
                    ExpenseReportCard.Run();
                end;
            }

            group("Filter by Status")
            {
                Caption = 'Filter by Status';
                action("Show All")
                {
                    ApplicationArea = All;
                    Caption = 'Show All';
                    Image = ClearFilter;
                    Promoted = true;
                    PromotedCategory = Category5;
                    ToolTip = 'Show all my expense reports regardless of status';

                    trigger OnAction()
                    begin
                        Rec.SetRange(Status);
                        CurrPage.Update(false);
                    end;
                }

                action("Show Draft")
                {
                    ApplicationArea = All;
                    Caption = 'Draft Reports';
                    Image = Document;
                    Promoted = true;
                    PromotedCategory = Category5;
                    ToolTip = 'Show only draft expense reports';

                    trigger OnAction()
                    begin
                        Rec.SetRange(Status, Rec.Status::Draft);
                        CurrPage.Update(false);
                    end;
                }

                action("Show Submitted")
                {
                    ApplicationArea = All;
                    Caption = 'Submitted Reports';
                    Image = SendTo;
                    Promoted = true;
                    PromotedCategory = Category5;
                    ToolTip = 'Show only submitted expense reports pending approval';

                    trigger OnAction()
                    begin
                        Rec.SetRange(Status, Rec.Status::Submitted);
                        CurrPage.Update(false);
                    end;
                }

                action("Show Approved")
                {
                    ApplicationArea = All;
                    Caption = 'Approved Reports';
                    Image = Approval;
                    Promoted = true;
                    PromotedCategory = Category5;
                    ToolTip = 'Show only approved expense reports';

                    trigger OnAction()
                    begin
                        Rec.SetRange(Status, Rec.Status::Approved);
                        CurrPage.Update(false);
                    end;
                }
            }
        }

        area(navigation)
        {
            action("Expense Report Lines")
            {
                ApplicationArea = All;
                Caption = 'Expense Lines';
                Image = Line;
                RunObject = Page "Expense Report Lines List";
                RunPageLink = "Report Id" = FIELD("Report Id");
                ToolTip = 'View the expense lines for this report';
            }
        }
    }

    trigger OnOpenPage()
    begin
        // Filter to show only reports where current user is involved
        SetMyExpenseReportsFilter();
    end;

    trigger OnAfterGetRecord()
    begin
        SetStatusStyle();
    end;

    local procedure SetMyExpenseReportsFilter()
    var
        CurrentUserId: Text[50];
        EmployeeRec: Record Employees;
        FilterString: Text[250];
    begin
        CurrentUserId := UserId();

        // Build filter to show reports where current user is involved
        FilterString := CurrentUserId;

        // Try to find employee record for current user
        Clear(EmployeeRec);
        EmployeeRec.SetRange("Employee Id", CurrentUserId);
        if not EmployeeRec.FindFirst() then begin
            // Try to find by email if direct ID match fails
            EmployeeRec.SetRange("Employee Id");
            EmployeeRec.SetRange(Email, CurrentUserId);
            if EmployeeRec.FindFirst() then
                FilterString := FilterString + '|' + EmployeeRec."Employee Id";
        end else begin
            // Add employee ID to filter if different from user ID
            if EmployeeRec."Employee Id" <> CurrentUserId then
                FilterString := FilterString + '|' + EmployeeRec."Employee Id";
        end;

        // Set security filter to show only relevant reports
        Rec.FilterGroup(2);

        // Create compound filter: Reports created by user OR assigned to user's employee record
        Rec.SetFilter("Created By", '%1', CurrentUserId);
        if EmployeeRec."Employee Id" <> '' then begin
            // Add OR condition for employee assignment
            Rec.SetFilter("Employee Id", '%1', EmployeeRec."Employee Id");
        end;

        Rec.FilterGroup(0);

        // Set default sort order by Status and then by Date
        Rec.SetCurrentKey(Status, "Report Date");
        Rec.Ascending(false); // Most recent first within each status
    end;

    local procedure SetStatusStyle()
    begin
        case Rec.Status of
            Rec.Status::Draft:
                StatusStyleExpr := 'StandardAccent';
            Rec.Status::Submitted:
                StatusStyleExpr := 'Attention';
            Rec.Status::Approved:
                StatusStyleExpr := 'Favorable';
            Rec.Status::Rejected:
                StatusStyleExpr := 'Unfavorable';
            Rec.Status::Paid:
                StatusStyleExpr := 'Strong';
            else
                StatusStyleExpr := '';
        end;
    end;

    var
        StatusStyleExpr: Text;
}
