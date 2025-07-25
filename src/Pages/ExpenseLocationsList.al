page 50160 "Expense Locations List"
{
    PageType = List;
    SourceTable = "Expense Locations";
    ApplicationArea = All;
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Location Code"; "Location Code") { ApplicationArea = All; }
                field("Country Region Code"; "Country Region Code") { ApplicationArea = All; }
                field(Description; Description) { ApplicationArea = All; }
            }
        }
    }
}
