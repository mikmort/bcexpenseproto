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
                field("Itemization Id"; "Itemization Id") { ApplicationArea = All; }
                field("Line Id"; "Line Id") { ApplicationArea = All; }
                field("Total Amount"; "Total Amount") { ApplicationArea = All; }
                field("Total Reimbursable Amount"; "Total Reimbursable Amount") { ApplicationArea = All; }
            }
        }
    }
}
