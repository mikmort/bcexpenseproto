table 50102 "Expense Reports"
{
    DataClassification = ToBeClassified;
    fields
    {
        field(1; "Report Id"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(2; "Employee Id"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Employees."Employee Id";
        }
        field(3; Purpose; Text[255])
        {
            DataClassification = ToBeClassified;
        }
        field(4; Destination; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(5; "Report Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(6; "Posting Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(7; "Currency Code"; Code[3])
        {
            DataClassification = ToBeClassified;
        }
        field(8; "Total Amount"; Decimal)
        {
            DataClassification = ToBeClassified;
            DecimalPlaces = 0 : 2;
        }
        field(9; Status; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(10; "Payment Method Code"; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = PaymentMethods."Payment Method Code";
        }
        field(11; "Pre Approval Number"; Code[30])
        {
            DataClassification = ToBeClassified;
            BlankZero = true;
        }
        field(12; "Receipts Attached"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(13; "Created By"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(14; "Created Date Time"; DateTime)
        {
            DataClassification = ToBeClassified;
        }
        field(15; "Modified Date Time"; DateTime)
        {
            DataClassification = ToBeClassified;
        }
    }
    keys
    {
        key(PK; "Report Id")
        {
            Clustered = true;
        }
    }
}
