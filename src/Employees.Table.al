table 50101 Employees
{
    Caption = 'Employees';
    DataClassification = ToBeClassified;
    LookupPageId = "Employees List";
    DrillDownPageId = "Employees List";

    fields
    {
        field(1; "Employee Id"; Code[20])
        {
            Caption = 'Employee ID';
            DataClassification = ToBeClassified;
            NotBlank = true;
        }
        field(2; "First Name"; Text[100])
        {
            Caption = 'First Name';
            DataClassification = ToBeClassified;
            NotBlank = true;
        }
        field(3; "Last Name"; Text[100])
        {
            Caption = 'Last Name';
            DataClassification = ToBeClassified;
            NotBlank = true;
        }
        field(4; Email; Text[255])
        {
            Caption = 'Email';
            DataClassification = ToBeClassified;
            ExtendedDatatype = EMail;

            trigger OnValidate()
            begin
                if Email <> '' then
                    ValidateEmailFormat();
            end;
        }
        field(5; "Default Currency"; Code[3])
        {
            Caption = 'Default Currency';
            DataClassification = ToBeClassified;
            TableRelation = Currency.Code;
            
            trigger OnValidate()
            begin
                if "Default Currency" <> '' then
                    TestField("Default Currency");
            end;
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
        key(Name; "Last Name", "First Name")
        {
        }
    }

    trigger OnInsert()
    begin
        TestField("Employee Id");
        TestField("First Name");
        TestField("Last Name");
        
        if "Default Currency" = '' then
            "Default Currency" := GetDefaultCurrency();
    end;

    trigger OnModify()
    begin
        TestField("Employee Id");
    end;

    trigger OnDelete()
    var
        ExpenseReport: Record "Expense Reports";
    begin
        ExpenseReport.SetRange("Employee Id", "Employee Id");
        if not ExpenseReport.IsEmpty() then
            Error('Cannot delete employee %1 because expense reports exist for this employee.', "Employee Id");
    end;

    local procedure ValidateEmailFormat()
    var
        EmailRegex: Text;
    begin
        EmailRegex := '^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
        // Basic email validation could be implemented here
        if StrLen(Email) < 5 then
            Error('Invalid email format.');
    end;

    local procedure GetDefaultCurrency(): Code[3]
    var
        GeneralLedgerSetup: Record "General Ledger Setup";
    begin
        if GeneralLedgerSetup.Get() then
            exit(GeneralLedgerSetup."LCY Code");
        exit('USD');
    end;

    procedure GetFullName(): Text[200]
    begin
        exit("First Name" + ' ' + "Last Name");
    end;

    procedure HasExpenseReports(): Boolean
    var
        ExpenseReport: Record "Expense Reports";
    begin
        ExpenseReport.SetRange("Employee Id", "Employee Id");
        exit(not ExpenseReport.IsEmpty());
    end;
}
