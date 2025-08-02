page 50173 "Expense Report Line Card"
{
    PageType = Card;
    SourceTable = "Expense Report Lines";
    ApplicationArea = All;
    UsageCategory = Documents;

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Line Id"; Rec."Line Id") { ApplicationArea = All; }
                field("Report Id"; Rec."Report Id") { ApplicationArea = All; }
                field("Line Number"; Rec."Line Number") { ApplicationArea = All; }
                field("Expense Date"; Rec."Expense Date") { ApplicationArea = All; }
                field("Category Code"; Rec."Category Code") { ApplicationArea = All; }
                field("Subcategory Code"; Rec."Subcategory Code") { ApplicationArea = All; }
                field("Currency Code"; Rec."Currency Code") { ApplicationArea = All; }
                field(Amount; Rec.Amount) { ApplicationArea = All; }
                field("Tax Amount"; Rec."Tax Amount") { ApplicationArea = All; }
                field("Reimbursable Amount"; Rec."Reimbursable Amount") { ApplicationArea = All; }
                field("Expense Location Code"; Rec."Expense Location Code") { ApplicationArea = All; }
                field("Payment Method Code"; Rec."Payment Method Code") { ApplicationArea = All; }
                field("Receipt Required"; Rec."Receipt Required") { ApplicationArea = All; }
                field(Description; Rec.Description) { ApplicationArea = All; }
                field("Project Id"; Rec."Project Id") { ApplicationArea = All; }
                field("Customer Account"; Rec."Customer Account") { ApplicationArea = All; }
                field("Vendor Account"; Rec."Vendor Account") { ApplicationArea = All; }
                field(Status; Rec.Status) { ApplicationArea = All; }
            }
        }
    }
}


