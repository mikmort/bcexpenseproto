page 50185 "Per Diem Expenses List"
{
    PageType = List;
    SourceTable = "Per Diem Expenses";
    ApplicationArea = All;
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Per Diem Id"; "Per Diem Id") { ApplicationArea = All; }
                field("Line Id"; "Line Id") { ApplicationArea = All; }
                field("Employee Id"; "Employee Id") { ApplicationArea = All; }
                field("Expense Date"; "Expense Date") { ApplicationArea = All; }
                field("Expense Location Code"; "Expense Location Code") { ApplicationArea = All; }
                field("Daily Rate"; "Daily Rate") { ApplicationArea = All; }
                field("Itemized Amount"; "Itemized Amount") { ApplicationArea = All; }
            }
        }
    }
}
