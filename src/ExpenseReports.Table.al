table 50102 "Expense Reports"
{
    DataClassification = ToBeClassified;
    fields
    {
        field(1; "Report Id"; Code[30])
        {
            Caption = 'Report ID';
            DataClassification = ToBeClassified;

            trigger OnValidate()
            var
                ExpenseSetup: Record "Expense Management Setup";
                NoSeries: Codeunit "No. Series";
            begin
                if "Report Id" <> xRec."Report Id" then begin
                    if ExpenseSetup.Get(1) then begin
                        NoSeries.TestManual(ExpenseSetup."Expense Report No. Sequence");
                        "No. Series" := '';
                    end;
                end;
            end;
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
            TableRelation = Currency.Code;
        }
        field(8; "Total Amount"; Decimal)
        {
            Caption = 'Total Amount';
            DataClassification = ToBeClassified;
            DecimalPlaces = 0 : 2;
        }
        field(9; Status; Enum "Expense Status")
        {
            Caption = 'Status';
            DataClassification = ToBeClassified;
        }
        field(10; "Payment Method Code"; Code[10])
        {
            Caption = 'Payment Method Code';
            DataClassification = ToBeClassified;
            TableRelation = "Payment Methods"."Payment Method Code";
        }
        field(11; "Pre Approval Number"; Code[30])
        {
            Caption = 'Pre Approval Number';
            DataClassification = ToBeClassified;
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
        field(16; "No. Series"; Code[20])
        {
            Caption = 'No. Series';
            DataClassification = ToBeClassified;
            TableRelation = "No. Series".Code;
            Editable = false;
        }
    }
    keys
    {
        key(PK; "Report Id")
        {
            Clustered = true;
        }
    }

    trigger OnInsert()
    var
        ExpenseSetup: Record "Expense Management Setup";
        NoSeries: Codeunit "No. Series";
    begin
        if "Report Id" = '' then begin
            if not ExpenseSetup.Get(1) then begin
                // Create default setup if it doesn't exist
                ExpenseSetup.Init();
                ExpenseSetup."Setup Id" := 1;
                ExpenseSetup."Expense Report No. Sequence" := 'EXP-REPORT';
                ExpenseSetup."Posted Expense Report No Seq." := 'POSTED-EXP';
                ExpenseSetup."Enable Expense Agent" := true;
                ExpenseSetup.Insert();
            end;
            ExpenseSetup.TestField("Expense Report No. Sequence");
            "Report Id" := NoSeries.GetNextNo(ExpenseSetup."Expense Report No. Sequence", "Report Date", true);
            "No. Series" := ExpenseSetup."Expense Report No. Sequence";
        end;
    end;

    trigger OnModify()
    begin
        "Modified Date Time" := CurrentDateTime();
    end;

    procedure AssistEdit(OldExpenseReport: Record "Expense Reports"): Boolean
    var
        ExpenseReport: Record "Expense Reports";
        ExpenseSetup: Record "Expense Management Setup";
        NoSeries: Codeunit "No. Series";
    begin
        ExpenseReport := Rec;
        if not ExpenseSetup.Get(1) then
            exit(false);
        ExpenseSetup.TestField("Expense Report No. Sequence");
        if NoSeries.LookupRelatedNoSeries(ExpenseSetup."Expense Report No. Sequence", OldExpenseReport."No. Series", ExpenseReport."No. Series") then begin
            ExpenseReport."Report Id" := NoSeries.GetNextNo(ExpenseReport."No. Series", ExpenseReport."Report Date", true);
            Rec := ExpenseReport;
            exit(true);
        end;
    end;
}
