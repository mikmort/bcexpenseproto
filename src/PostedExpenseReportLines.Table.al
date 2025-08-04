table 50118 "Posted Expense Report Lines"
{
    DataClassification = ToBeClassified;
    fields
    {
        field(1; "Posted Report Id"; Code[30])
        {
            Caption = 'Posted Report ID';
            DataClassification = ToBeClassified;
            TableRelation = "Posted Expense Report Headers"."Posted Report Id";
        }
        field(2; "Line Number"; Integer)
        {
            Caption = 'Line Number';
            DataClassification = ToBeClassified;
        }
        field(3; "Employee Id"; Code[20])
        {
            Caption = 'Employee ID';
            DataClassification = ToBeClassified;
            TableRelation = Employee."No.";
        }
        field(4; "Category Code"; Code[20])
        {
            Caption = 'Category Code';
            DataClassification = ToBeClassified;
            TableRelation = "Expense Categories"."Category Code";
        }
        field(5; Amount; Decimal)
        {
            Caption = 'Amount';
            DataClassification = ToBeClassified;
            DecimalPlaces = 0 : 2;
        }
        field(6; "Currency Code"; Code[3])
        {
            Caption = 'Currency Code';
            DataClassification = ToBeClassified;
            TableRelation = Currency.Code;
        }
        field(7; "Expense Location Code"; Code[10])
        {
            Caption = 'Expense Location Code';
            DataClassification = ToBeClassified;
            TableRelation = "Expense Locations"."Location Code";
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
