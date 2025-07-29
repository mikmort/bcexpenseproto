table 50101 Employees
{
    DataClassification = ToBeClassified;
    fields
    {
        field(1; "Employee Id"; Code[20])
        {
            Caption = 'Employee ID';
            DataClassification = ToBeClassified;
        } 
        field(2; "First Name"; Text[100])
        {
            Caption = 'First Name';
            DataClassification = ToBeClassified;
        }
        field(3; "Last Name"; Text[100])
        {
            Caption = 'Last Name';
            DataClassification = ToBeClassified;
        }
        field(4; Email; Text[255])
        {
            Caption = 'Email';
            DataClassification = ToBeClassified;
        }
        field(5; "Default Currency"; Code[3])
        {
            Caption = 'Default Currency';
            DataClassification = ToBeClassified;
            TableRelation = Currency.Code;
        }
        field(6; "Legal Entity"; Code[10])
        {
            Caption = 'Legal Entity';
            DataClassification = ToBeClassified;
        }
    }
    keys
    {
        key(PK; "Employee Id")
        {
            Clustered = true;
        }
        key(Email; Email)
        {
            Unique = true;
        }
    }
}
