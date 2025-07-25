page 50157 "Expense Subcategory Card"
{
    PageType = Card;
    SourceTable = "Expense Subcategories";
    ApplicationArea = All;
    UsageCategory = Administration;

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Subcategory Code"; "Subcategory Code") { ApplicationArea = All; }
                field("Category Code"; "Category Code") { ApplicationArea = All; }
                field(Description; Description) { ApplicationArea = All; }
                field(Refundable; Refundable) { ApplicationArea = All; }
                field(Active; Active) { ApplicationArea = All; }
            }
        }
    }
}
