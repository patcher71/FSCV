
function DAtotal = RDModel(app, time, r, ke, ku, ku2, kads, kdes, axesHandle)
    
   DA = zeros(size(time));
    DAads = zeros(size(time));
    DAtotal = zeros(size(time));
    dt = time(2) - time(1);
    
    %Debugging
    %disp(['dt = ', num2str(dt)]);
    %disp(['ke = ', num2str(ke)]);

    % Use the first element of time as the initial time
    initialTime = time(1);

    for i = 2:length(time)
        % Calculate time relative to initialTime
        relativeTime = time(i-1) - initialTime;

        dDA_dt = r * exp(-ke * relativeTime) - (ku * DA(i-1) + ku2 * DA(i-1));
        DA(i) = DA(i-1) + dDA_dt * dt;
        dDAads_dt = kads * DA(i-1) - kdes * DAads(i-1);
        DAads(i) = DAads(i-1) + dDAads_dt * dt;
        DAtotal(i) = DA(i) + DAads(i);
    end

    % Plotting on the provided axesHandle
    if isgraphics(axesHandle, 'axes')
        plot(axesHandle, time, DAtotal, 'r-'); % Plot DAtotal
        title(axesHandle, 'RD Model Fit');
        xlabel(axesHandle, 'Time (s)');
        ylabel(axesHandle, 'Model Output');
    end

    DAtotal = DAtotal; % Return the DAtotal vector
end