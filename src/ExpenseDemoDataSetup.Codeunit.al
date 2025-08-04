codeunit 50192 "Expense Demo Data Setup"
{
    trigger OnRun()
    begin
        CreateAllData();
    end;

    procedure CreateAllData()
    begin
        CreateSetupData();
        CreateDemoData();
    end;

    procedure CreateSetupDataOnly()
    var
        SetupDataCodeunit: Codeunit "Expense Setup Data";
        TempInteger: Record Integer temporary;
    begin
        TempInteger.Number := 1;
        TempInteger.Insert();
        SetupDataCodeunit.Run(TempInteger);
    end;

    procedure CreateDemoDataOnly()
    var
        DemoDataCodeunit: Codeunit "Expense Demo Data";
        TempInteger: Record Integer temporary;
    begin
        TempInteger.Number := 1;
        TempInteger.Insert();
        DemoDataCodeunit.Run(TempInteger);
    end;

    local procedure CreateSetupData()
    var
        SetupDataCodeunit: Codeunit "Expense Setup Data";
        TempInteger: Record Integer temporary;
    begin
        TempInteger.Number := 1;
        TempInteger.Insert();
        SetupDataCodeunit.Run(TempInteger);
    end;

    local procedure CreateDemoData()
    var
        DemoDataCodeunit: Codeunit "Expense Demo Data";
        TempInteger: Record Integer temporary;
    begin
        TempInteger.Number := 1;
        TempInteger.Insert();
        DemoDataCodeunit.Run(TempInteger);
    end;
}
