function Key_check
global key

%%
if ~key.Up.Ready && ~key.Up.Status
    key.Up.Ready = true;
end

if ~key.Down.Ready && ~key.Down.Status
    key.Down.Ready = true;
end

if ~key.Right.Ready && ~key.Right.Status
    key.Right.Ready = true;
end

if ~key.Left.Ready && ~key.Left.Status
    key.Left.Ready = true;
end

if ~key.OK.Ready && ~key.OK.Status
    key.OK.Ready = true;
end

if ~key.Pause.Ready && ~key.Pause.Status
    key.Pause.Ready = true;
end

if ~key.Jump.Ready && ~key.Jump.Status
    key.Jump.Ready = true;
end