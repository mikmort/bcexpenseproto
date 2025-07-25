page 50151 "Employee Card"
{
    PageType = Card;
    SourceTable = Employees;
    ApplicationArea = All;
    UsageCategory = Administration;

    layout
    {
        area(content)
        {
            group(General)
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
}
