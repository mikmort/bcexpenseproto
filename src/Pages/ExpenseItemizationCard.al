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
                field("Itemization Id"; "Itemization Id") { ApplicationArea = All; }
                field("Line Id"; "Line Id") { ApplicationArea = All; }
                field("Total Amount"; "Total Amount") { ApplicationArea = All; }
                field("Total Reimbursable Amount"; "Total Reimbursable Amount") { ApplicationArea = All; }
            }
        }
    }
}
