table 50101 Employees
{
    DataClassification = ToBeClassified;
    fields
    {
        field(1; "Employee Id"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(2; "First Name"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(3; "Last Name"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(4; Email; Text[255])
        {
            DataClassification = ToBeClassified;
        }
        field(5; "Default Currency"; Code[3])
        {
            DataClassification = ToBeClassified;
        }
        field(6; "Legal Entity"; Code[10])
        {
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
