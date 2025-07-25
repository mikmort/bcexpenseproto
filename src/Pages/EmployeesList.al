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
                field("Employee Id"; "Employee Id") { ApplicationArea = All; }
                field("First Name"; "First Name") { ApplicationArea = All; }
                field("Last Name"; "Last Name") { ApplicationArea = All; }
                field(Email; Email) { ApplicationArea = All; }
                field("Default Currency"; "Default Currency") { ApplicationArea = All; }
                field("Legal Entity"; "Legal Entity") { ApplicationArea = All; }
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
                RunObject = page "Employee Card";
                Promoted = true;
            }
        }
    }
}
