function dst = restore_image(src, covar, max_diff, weight_diff, iterations)

% Maintain two buffer images.
% In alternate iterations, one will be the
% source image, the other the destination.
buffer = zeros(size(src,1), size(src,2), 2);
buffer(:,:,1) = src;
s = 2;
d = 1;

% This value is guaranteed to be larger than the
% potential of any configuration of pixel values.
V_max = (size(src,1) * size(src,2)) * ...
        ((256)^2 / (2*covar) + 4 * weight_diff * max_diff);

for i = 1 : iterations

    % Switch source and destination buffers.
    if s == 1
        s = 2;
        d = 1;
    else
        s = 1;
        d = 2;
    end

    % Vary each pixel individually to find the
    % values that minimise the local potentials.
    for r = 1 : size(src,1)
        for c = 1 : size(src,2)

            V_local = V_max;
            min_val = -1;
            for val = 0 : 255

                % The component of the potential due to the known data.
                V_data = (val - src(r,c))^2 / (2 * covar);

                % The component of the potential due to the
                % difference between neighbouring pixel values.
                V_diff = 0;
                if r > 1
                    V_diff = V_diff + ...
                    min( (val - buffer(r-1,c,s))^2, max_diff );
                end
                if r < size(src,1)
                    V_diff = V_diff + ...
                    min( (val - buffer(r+1,c,s))^2, max_diff );
                end
                if c > 1
                    V_diff = V_diff + ...
                    min( (val - buffer(r,c-1,s))^2, max_diff );
                end
                if c < size(src,2)
                    V_diff = V_diff + ...
                    min( (val - buffer(r,c+1,s))^2, max_diff );
                end

                V_current = V_data + weight_diff * V_diff;

                if V_current < V_local
                    min_val = val;
                    V_local = V_current;
                end

            end

            buffer(r,c,d) = min_val;
        end
    end

    
end

dst = buffer(:,:,d);
end