page 50178 "Expense Receipt Card"
{
    PageType = Card;
    SourceTable = "Expense Receipts";
    ApplicationArea = All;
    UsageCategory = Documents;

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Receipt Id"; "Receipt Id") { ApplicationArea = All; }
                field("Line Id"; "Line Id") { ApplicationArea = All; }
                field("File Name"; "File Name") { ApplicationArea = All; }
                field("File Uri"; "File Uri") { ApplicationArea = All; }
                field("Uploaded Date Time"; "Uploaded Date Time") { ApplicationArea = All; }
                field("Amount On Receipt"; "Amount On Receipt") { ApplicationArea = All; }
                field("Currency Code"; "Currency Code") { ApplicationArea = All; }
            }
        }
    }
}
