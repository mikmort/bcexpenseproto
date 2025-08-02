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
                field("Per Diem Id"; Rec."Per Diem Id") { ApplicationArea = All; }
                field("Line Id"; Rec."Line Id") { ApplicationArea = All; }
                field("Employee Id"; Rec."Employee Id") { ApplicationArea = All; }
                field("Expense Date"; Rec."Expense Date") { ApplicationArea = All; }
                field("Expense Location Code"; Rec."Expense Location Code") { ApplicationArea = All; }
                field("Daily Rate"; Rec."Daily Rate") { ApplicationArea = All; }
                field("Itemized Amount"; Rec."Itemized Amount") { ApplicationArea = All; }
            }
        }
    }
}


