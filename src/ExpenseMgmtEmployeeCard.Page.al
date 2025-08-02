page 50151 "Expense Mgmt Employee Card"
{
    PageType = Card;
    SourceTable = Employees;
    ApplicationArea = All;
    UsageCategory = Administration;
    Caption = 'Employee Card';

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General Information';
                
                field("Employee Id"; Rec."Employee Id")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the unique identifier for the employee.';
                }
                field("First Name"; Rec."First Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the first name of the employee.';
                }
                field("Last Name"; Rec."Last Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the last name of the employee.';
                }
                field(Email; Rec.Email)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the email address of the employee.';
                    ExtendedDatatype = EMail;
                }
                field("Default Currency"; Rec."Default Currency")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the default currency for expense reports by this employee.';
                }
                field("Legal Entity"; Rec."Legal Entity")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the legal entity the employee belongs to.';
                }
            }
        }
    }

    actions
    {
        area(Navigation)
        {
            action(ExpenseReports)
            {
                ApplicationArea = All;
                Caption = 'Expense Reports';
                Image = Document;
                RunObject = page "Expense Reports List";
                RunPageLink = "Employee Id" = field("Employee Id");
                ToolTip = 'View expense reports for this employee.';
            }
        }
    }

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        // Set default values for new employee records
        if Rec."Default Currency" = '' then
            Rec."Default Currency" := 'USD';
    end;
}


