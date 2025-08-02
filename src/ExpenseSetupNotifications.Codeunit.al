codeunit 50199 "Expense Setup Notifications"
{
    // This codeunit handles setup notifications and reminders for the Expense Management system

    [EventSubscriber(ObjectType::Page, Page::"Expense Management Menu", 'OnOpenPageEvent', '', false, false)]
    local procedure ShowSetupNotificationOnRoleCenter()
    var
        ExpenseGuidedSetup: Codeunit "Expense Management Guided Setup";
        SetupNotification: Notification;
    begin
        if ExpenseGuidedSetup.IsSetupComplete() then
            exit;

        SetupNotification.Id := GetSetupNotificationId();
        SetupNotification.Message := 'Complete the Expense Management setup to start using the system effectively.';
        SetupNotification.Scope := NotificationScope::LocalScope;
        SetupNotification.AddAction('Run Setup Wizard', Codeunit::"Expense Setup Notifications", 'RunSetupWizard');
        SetupNotification.AddAction('Don''t show again', Codeunit::"Expense Setup Notifications", 'DisableSetupNotification');
        SetupNotification.Send();
    end;

    [EventSubscriber(ObjectType::Page, Page::"Expense Reports List", 'OnOpenPageEvent', '', false, false)]
    local procedure ShowSetupNotificationOnExpenseReports()
    var
        ExpenseGuidedSetup: Codeunit "Expense Management Guided Setup";
        SetupNotification: Notification;
    begin
        if ExpenseGuidedSetup.IsSetupComplete() then
            exit;

        if IsSetupNotificationDisabled() then
            exit;

        SetupNotification.Id := GetSetupNotificationId();
        SetupNotification.Message := StrSubstNo('Setup incomplete: %1. Click here to complete the setup.', 
            ExpenseGuidedSetup.GetSetupStatus());
        SetupNotification.Scope := NotificationScope::LocalScope;
        SetupNotification.AddAction('Complete Setup', Codeunit::"Expense Setup Notifications", 'RunSetupWizard');
        SetupNotification.AddAction('Dismiss', Codeunit::"Expense Setup Notifications", 'DismissNotification');
        SetupNotification.Send();
    end;

    procedure RunSetupWizard(SetupNotification: Notification)
    begin
        SetupNotification.Recall();
        Page.RunModal(Page::"Expense Management Setup Wizard");
    end;

    procedure DisableSetupNotification(SetupNotification: Notification)
    var
        UserPreference: Record "User Preference";
    begin
        SetupNotification.Recall();
        
        if not UserPreference.Get(UserId(), 'ExpenseSetupNotification') then begin
            UserPreference.Init();
            UserPreference."User ID" := UserId();
            UserPreference."Instruction Code" := 'ExpenseSetupNotification';
            UserPreference.Insert();
        end;
        
        UserPreference."Disable Instruction" := true;
        UserPreference.Modify();
    end;

    procedure DismissNotification(SetupNotification: Notification)
    begin
        SetupNotification.Recall();
    end;

    local procedure IsSetupNotificationDisabled(): Boolean
    var
        UserPreference: Record "User Preference";
    begin
        if UserPreference.Get(UserId(), 'ExpenseSetupNotification') then
            exit(UserPreference."Disable Instruction");
        
        exit(false);
    end;

    local procedure GetSetupNotificationId(): Guid
    begin
        exit('8BC032A1-9E94-4F62-AD8A-7B3F7C2E1D95');
    end;
}
