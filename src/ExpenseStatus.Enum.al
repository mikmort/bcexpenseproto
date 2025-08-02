enum 50100 "Expense Status"
{
    Extensible = true;
    
    value(0; Draft)
    {
        Caption = 'Draft';
    }
    value(1; Submitted)
    {
        Caption = 'Submitted';
    }
    value(2; Approved)
    {
        Caption = 'Approved';
    }
    value(3; Rejected)
    {
        Caption = 'Rejected';
    }
    value(4; Paid)
    {
        Caption = 'Paid';
    }
}
