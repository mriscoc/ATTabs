unit attabs_register_delphi;

interface

uses
  Classes, SysUtils, 
  ATTabs;

procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('Misc', [TATTabs]);
end;

initialization

end.

