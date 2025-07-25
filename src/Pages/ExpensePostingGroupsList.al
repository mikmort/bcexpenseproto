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
                field("Posting Group Code"; "Posting Group Code") { ApplicationArea = All; }
                field("Refundable Debit Account"; "Refundable Debit Account") { ApplicationArea = All; }
                field("Non Refundable Debit Account"; "Non Refundable Debit Account") { ApplicationArea = All; }
                field("Prepayment Credit Account"; "Prepayment Credit Account") { ApplicationArea = All; }
            }
        }
    }
}
