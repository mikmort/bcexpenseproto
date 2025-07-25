page 50156 "Expense Subcategories List"
{
    PageType = List;
    SourceTable = "Expense Subcategories";
    ApplicationArea = All;
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Group)
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
