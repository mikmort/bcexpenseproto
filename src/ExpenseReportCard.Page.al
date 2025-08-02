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

                trigger OnAction()
                begin
                    // Implementation for submitting report
                    Message('Report submitted for approval.');
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
            action(ExpenseLines)
            {
                ApplicationArea = All;
                Caption = 'Expense Lines';
                Image = Line;
                RunObject = page "Expense Report Lines List";
                RunPageLink = "Report Id" = field("Report Id");
                ToolTip = 'View the individual expense lines for this report.';
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
        Rec."Created Date Time" := CurrentDateTime();
        Rec."Created By" := UserId();
    end;

    trigger OnModifyRecord(): Boolean
    begin
        Rec."Modified Date Time" := CurrentDateTime();
    end;
}


