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
                field("Subcategory Code"; Rec."Subcategory Code") { ApplicationArea = All; }
                field("Category Code"; Rec."Category Code") { ApplicationArea = All; }
                field(Description; Rec.Description) { ApplicationArea = All; }
                field(Refundable; Rec.Refundable) { ApplicationArea = All; }
                field(Active; Rec.Active) { ApplicationArea = All; }
            }
        }
    }
}


