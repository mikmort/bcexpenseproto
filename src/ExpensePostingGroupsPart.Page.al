page 50197 "Expense Posting Groups Part"
{
    PageType = ListPart;
    SourceTable = "Expense Posting Groups";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Posting Group Code"; Rec."Posting Group Code") 
                { 
                    ApplicationArea = All; 
                    ToolTip = 'Specifies the posting group code.';
                }
                field("Description"; Rec."Description") 
                { 
                    ApplicationArea = All; 
                    ToolTip = 'Specifies the description of the posting group.';
                }
                field("Refundable Debit Account"; Rec."Refundable Debit Account") 
                { 
                    ApplicationArea = All; 
                    ToolTip = 'Specifies the G/L account for refundable expenses (employee receivable).';
                }
                field("Non Refundable Debit Account"; Rec."Non Refundable Debit Account") 
                { 
                    ApplicationArea = All; 
                    ToolTip = 'Specifies the G/L account for non-refundable expenses (expense GL).';
                }
                field("Prepayment Credit Account"; Rec."Prepayment Credit Account") 
                { 
                    ApplicationArea = All; 
                    ToolTip = 'Specifies the G/L account for prepayments (travel advance / company card clearing).';
                }
            }
        }
    }
}
