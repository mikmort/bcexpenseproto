table 50118 "Posted Expense Report Lines"
{
    DataClassification = ToBeClassified;
    fields
    {
        field(1; "Posted Report Id"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(2; "Line Number"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(3; "Employee Id"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(4; "Category Code"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(5; Amount; Decimal)
        {
            DataClassification = ToBeClassified;
            DecimalPlaces = 0 : 2;
        }
        field(6; "Currency Code"; Code[3])
        {
            DataClassification = ToBeClassified;
        }
        field(7; "Expense Location Code"; Code[10])
        {
            DataClassification = ToBeClassified;
        }
    }
    keys
    {
        key(PK; "Posted Report Id", "Line Number")
        {
            Clustered = true;
        }
    }
}
