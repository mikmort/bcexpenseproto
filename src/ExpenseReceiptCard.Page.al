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
                field("Receipt Id"; Rec."Receipt Id") { ApplicationArea = All; }
                field("Line Id"; Rec."Line Id") { ApplicationArea = All; }
                field("File Name"; Rec."File Name") { ApplicationArea = All; }
                field("File Uri"; Rec."File Uri") { ApplicationArea = All; }
                field("Uploaded Date Time"; Rec."Uploaded Date Time") { ApplicationArea = All; }
                field("Amount On Receipt"; Rec."Amount On Receipt") { ApplicationArea = All; }
                field("Currency Code"; Rec."Currency Code") { ApplicationArea = All; }
            }
        }
    }
}


