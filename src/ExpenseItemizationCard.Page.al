page 50180 "Expense Itemization Card"
{
    PageType = Card;
    SourceTable = "Expense Itemizations";
    ApplicationArea = All;
    UsageCategory = Documents;

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Itemization Id"; Rec."Itemization Id") { ApplicationArea = All; }
                field("Line Id"; Rec."Line Id") { ApplicationArea = All; }
                field("Total Amount"; Rec."Total Amount") { ApplicationArea = All; }
                field("Total Reimbursable Amount"; Rec."Total Reimbursable Amount") { ApplicationArea = All; }
            }
        }
    }
}


