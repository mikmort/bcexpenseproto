table 50102 "Expense Reports"
{
    DataClassification = ToBeClassified;
    fields
    {
        field(1; "Report Id"; Code[30])
        {
            Caption = 'Report ID';
            DataClassification = ToBeClassified;
        }
        field(2; "Employee Id"; Code[20])
        {
            Caption = 'Employee ID';
            DataClassification = ToBeClassified;
            TableRelation = Employees."Employee Id";
        }
        field(3; Purpose; Text[255])
        {
            Caption = 'Purpose';
            DataClassification = ToBeClassified;
        }
        field(4; Destination; Text[100])
        {
            Caption = 'Destination';
            DataClassification = ToBeClassified;
        }
        field(5; "Report Date"; Date)
        {
            Caption = 'Report Date';
            DataClassification = ToBeClassified;
        }
        field(6; "Posting Date"; Date)
        {
            Caption = 'Posting Date';
            DataClassification = ToBeClassified;
        }
        field(7; "Currency Code"; Code[3])
        {
            Caption = 'Currency Code';
            DataClassification = ToBeClassified;
        }
        field(8; "Total Amount"; Decimal)
        {
            Caption = 'Total Amount';
            DataClassification = ToBeClassified;
            DecimalPlaces = 0 : 2;
        }
        field(9; Status; Code[30])
        {
            Caption = 'Status';
            DataClassification = ToBeClassified;
        }
        field(10; "Payment Method Code"; Code[10])
        {
            Caption = 'Payment Method Code';
            DataClassification = ToBeClassified;
            TableRelation = PaymentMethods."Payment Method Code";
        }
        field(11; "Pre Approval Number"; Code[30])
        {
            Caption = 'Pre Approval Number';
            DataClassification = ToBeClassified;
            BlankZero = true;
        }
        field(12; "Receipts Attached"; Boolean)
        {
            Caption = 'Receipts Attached';
            DataClassification = ToBeClassified;
        }
        field(13; "Created By"; Code[20])
        {
            Caption = 'Created By';
            DataClassification = ToBeClassified;
        }
        field(14; "Created Date Time"; DateTime)
        {
            Caption = 'Created Date Time';
            DataClassification = ToBeClassified;
        }
        field(15; "Modified Date Time"; DateTime)
        {
            Caption = 'Modified Date Time';
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
