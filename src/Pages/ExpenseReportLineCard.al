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
                field("Line Id"; "Line Id") { ApplicationArea = All; }
                field("Report Id"; "Report Id") { ApplicationArea = All; }
                field("Line Number"; "Line Number") { ApplicationArea = All; }
                field("Expense Date"; "Expense Date") { ApplicationArea = All; }
                field("Category Code"; "Category Code") { ApplicationArea = All; }
                field("Subcategory Code"; "Subcategory Code") { ApplicationArea = All; }
                field("Currency Code"; "Currency Code") { ApplicationArea = All; }
                field(Amount; Amount) { ApplicationArea = All; }
                field("Tax Amount"; "Tax Amount") { ApplicationArea = All; }
                field("Reimbursable Amount"; "Reimbursable Amount") { ApplicationArea = All; }
                field("Expense Location Code"; "Expense Location Code") { ApplicationArea = All; }
                field("Payment Method Code"; "Payment Method Code") { ApplicationArea = All; }
                field("Receipt Required"; "Receipt Required") { ApplicationArea = All; }
                field(Description; Description) { ApplicationArea = All; }
                field("Project Id"; "Project Id") { ApplicationArea = All; }
                field("Customer Account"; "Customer Account") { ApplicationArea = All; }
                field("Vendor Account"; "Vendor Account") { ApplicationArea = All; }
                field(Status; Status) { ApplicationArea = All; }
            }
        }
    }
}
