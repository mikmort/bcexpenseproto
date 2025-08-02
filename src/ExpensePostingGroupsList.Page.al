page 50164 "Expense Posting Groups List"
{
    PageType = List;
    SourceTable = "Expense Posting Groups";
    ApplicationArea = All;
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Posting Group Code"; Rec."Posting Group Code") { ApplicationArea = All; }
                field("Refundable Debit Account"; Rec."Refundable Debit Account") { ApplicationArea = All; }
                field("Non Refundable Debit Account"; Rec."Non Refundable Debit Account") { ApplicationArea = All; }
                field("Prepayment Credit Account"; Rec."Prepayment Credit Account") { ApplicationArea = All; }
            }
        }
    }
}


