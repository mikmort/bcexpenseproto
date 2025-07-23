table 50105 "Expense Subcategories"
{
    DataClassification = ToBeClassified;
    fields
    {
        field(1; "Subcategory Code"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(2; "Category Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Expense Categories"."Category Code";
        }
        field(3; Description; Text[255])
        {
            DataClassification = ToBeClassified;
        }
        field(4; Refundable; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(5; Active; Boolean)
        {
            DataClassification = ToBeClassified;
            InitValue = true;
        }
    }
    keys
    {
        key(PK; "Subcategory Code")
        {
            Clustered = true;
        }
    }
}
