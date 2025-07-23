table 50117 "Posted Expense Report Headers"
{
    DataClassification = ToBeClassified;
    fields
    {
        field(1; "Posted Report Id"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(2; "Report Id"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Expense Reports"."Report Id";
        }
        field(3; "Employee Id"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(4; "Posted Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(5; "Currency Code"; Code[3])
        {
            DataClassification = ToBeClassified;
        }
        field(6; "Total Amount"; Decimal)
        {
            DataClassification = ToBeClassified;
            DecimalPlaces = 0 : 2;
        }
    }
    keys
    {
        key(PK; "Posted Report Id")
        {
            Clustered = true;
        }
    }
}
