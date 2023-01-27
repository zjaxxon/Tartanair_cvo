# Copyright (C) 2022  Ray Zhang

# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.

# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
# THE SOFTWARE.



from evo.core.trajectory import PoseTrajectory3D
from evo.tools import file_interface
from scipy.spatial.transform import Rotation 
import numpy as np
import argparse

def xyzquat_to_kitti(original_f, output_f, start_ind, end_ind):
    original = np.loadtxt(original_f, dtype=float)
    print("read file {} with shape {}".format(original_f, original.shape))
    with open(output_f, 'w') as f:
        if len(original.shape) == 1:
            max_r = 1
        else:
            max_r = original.shape[0]
        counter = 0
        for r in range(max_r):
            if r < start_ind:
                continue
            if end_ind > start_ind and r == end_ind:
                break
            if len(original.shape) > 1:
                xyzq = original[r, :]
            else:
                xyzq = original[:]
            T = np.eye(4, dtype=float)
            T[0,3] = xyzq[0]
            T[1,3] = xyzq[1]
            T[2,3] = xyzq[2]
            quat = Rotation.from_quat([xyzq[-1], xyzq[-4], xyzq[-3], xyzq[-2]])
            r_mat = quat.as_matrix()
            T[:3,:3] = r_mat
            counter += 1
            for r in range(3):
                for c in range(4):
                    if (r==2 and c == 3):
                        f.write("{}\n".format(T[r, c]))
                    else:
                        f.write("{} ".format(T[r, c]))

        print("Just wrote {} lines".format(counter))

if __name__ == "__main__":
    import argparse
    parser = argparse.ArgumentParser()
    parser.add_argument("poses_file", help="input pose path file in xyzq format")
    parser.add_argument(
        "trajectory_out", help="output file path for trajectory in kitti format")
    parser.add_argument("start_ind", nargs='?', type=int, default=0, help="starting index")
    parser.add_argument("end_ind", nargs='?', type=int, default=-1, help="last index")
    args = parser.parse_args()
    trajectory = xyzquat_to_kitti(args.poses_file, args.trajectory_out, args.start_ind, args.end_ind)
