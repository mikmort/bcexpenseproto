page 50179 "Expense Itemizations List"
{
    PageType = List;
    SourceTable = "Expense Itemizations";
    ApplicationArea = All;
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Itemization Id"; Rec."Itemization Id") { ApplicationArea = All; }
                field("Line Id"; Rec."Line Id") { ApplicationArea = All; }
                field("Total Amount"; Rec."Total Amount") { ApplicationArea = All; }
                field("Total Reimbursable Amount"; Rec."Total Reimbursable Amount") { ApplicationArea = All; }
            }
        }
    }
}


