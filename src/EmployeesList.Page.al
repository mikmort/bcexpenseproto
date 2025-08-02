page 50150 "Employees List"
{
    PageType = List;
    SourceTable = Employees;
    ApplicationArea = All;
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Employee Id"; Rec."Employee Id") { ApplicationArea = All; }
                field("First Name"; Rec."First Name") { ApplicationArea = All; }
                field("Last Name"; Rec."Last Name") { ApplicationArea = All; }
                field(Email; Rec.Email) { ApplicationArea = All; }
                field("Default Currency"; Rec."Default Currency") { ApplicationArea = All; }
                field("Legal Entity"; Rec."Legal Entity") { ApplicationArea = All; }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action(New)
            {
                ApplicationArea = All;
                Caption = 'New';
                Image = New;
                RunObject = page "Expense Mgmt Employee Card";
                Promoted = true;
            }
        }
    }
}


