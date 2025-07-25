table 50117 "Posted Expense Report Headers"
{
    DataClassification = ToBeClassified;
    fields
    {
        field(1; "Posted Report Id"; Code[30])
        {
            Caption = 'Posted Report ID';
            DataClassification = ToBeClassified;
        }
        field(2; "Report Id"; Code[30])
        {
            Caption = 'Report ID';
            DataClassification = ToBeClassified;
            TableRelation = "Expense Reports"."Report Id";
        }
        field(3; "Employee Id"; Code[20])
        {
            Caption = 'Employee ID';
            DataClassification = ToBeClassified;
            TableRelation = Employees."Employee Id";
        }
        field(4; "Posted Date"; Date)
        {
            Caption = 'Posted Date';
            DataClassification = ToBeClassified;
        }
        field(5; "Currency Code"; Code[3])
        {
            Caption = 'Currency Code';
            DataClassification = ToBeClassified;
            TableRelation = Currency.Code;
        }
        field(6; "Total Amount"; Decimal)
        {
            Caption = 'Total Amount';
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
