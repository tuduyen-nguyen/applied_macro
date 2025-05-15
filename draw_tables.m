function [] = draw_tables(var_names, M_, T, xlimval, varargin)

n = size(var_names, 2);
nv = length(varargin);

ny = ceil(sqrt(n));
nx = ceil(n / ny);
figure;

colors = [
    0, 0, 1, 0.7;    % Blue
    1, 0, 0, 0.7;    % Red
    0, 0.6, 0, 0.7;  % Green
    1, 0.5, 0, 0.7;  % Orange
    0.3, 0.3, 0.3, 0.7;  % Gray
    0.5, 0, 0.5, 0.7  % Purple
];

% Line styles to help distinguish scenarios
line_styles = {'-', '--', ':', '-.', '-', '--'};

for ix = 1:n
    subplot(nx, ny, ix)
    hold on;
    idy = strmatch(var_names{ix}, M_.endo_names, 'exact');
    if isempty(idy)
        error(['Variable ' var_names{ix} ' does not exist.']);
    end

    for iy = 1:nv
        themat = varargin{iy};
        % Use color with transparency if supported
        if size(colors, 2) == 4
            plot(T, themat(idy, :), ...
                'LineWidth', 2.5, ...
                'Color', colors(iy, 1:4), ...
                'LineStyle', line_styles{iy});
        else
            plot(T, themat(idy, :), ...
                'LineWidth', 2.5, ...
                'Color', colors(iy, 1:3), ...
                'LineStyle', line_styles{iy});
        end
    end

    title(M_.endo_names_tex{idy})
    grid on;
    if ~isempty(xlimval)
        xlim(xlimval)
    end
    hold off;
end
end
