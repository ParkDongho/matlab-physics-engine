function main
global h;
global object;
global object_value;
global key;

%%
global dash_time;

global sc_size
global ax_size
global dt;

%%
close all;clc
sc_size  = get(0,'screensize');
disp(sc_size)

ax_size = [0 0 sc_size(3)/sc_size(4) * 100 100 ];

h.f = figure('name','GAME',...w
    'menubar','none',...
    'numbertitle','off',...
    'position',sc_size./2,...
    'KeyPressFcn', @Key_Down, 'KeyReleaseFcn', @Key_Up);

h.a = axes('xlim',[0 ax_size(3)],...
    'ylim',[0 ax_size(4)],...
    'xtick',[],...
    'ytick',[],...
    'box','on',...
    'position',[0, 0, 1, 1]);

init_object(); %object reset
init_variable(); %object_variable

dt = 0.03;
h.timer = timer('TimerFcn',@animation,'ExecutionMode','fixedDelay','Period',dt);
start(h.timer);