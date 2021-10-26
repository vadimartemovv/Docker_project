import numpy as np
import tensorflow as tf
import util
import selu


class MyTestCasePointCnn(tf.test.TestCase):
    pass


class MyTestCaseTrain(tf.test.TestCase):
    pass


class MyTestCaseSelu(tf.test.TestCase):
    def test_selu(self):
        test_inp = tf.constant([-1., 0., 1.])
        test_out = tf.constant([-0.6321, 0., 1.])
        out = selu.selu(test_inp)
        self.assertAlmostEqual(test_out, out, 3)


class MyTestCaseUtil(tf.test.TestCase):
    def test_leaky_relu(self):
        test_inp = tf.constant([-1., -1., 1., 1.])
        test_out = tf.constant([-0.1, -0.1, 1., 1.])
        out = util.leaky_relu(test_inp)
        self.assertAlmostEqual(test_out, out)

    def test_sort_point_cloud(self):
        test_inp = np.ones((1, 3, 2))
        test_out = np.ones((1, 3, 2))
        out = util.sort_point_cloud_xyz(test_inp)
        self.assertEqual(test_out, out)

    def test_sort_point_cloud2(self):
        test_inp_1 = np.ones((1, 3, 2))
        test_inp_2 = np.ones((1, 3, 3))

        test_out_1 = np.ones((1, 3, 2))
        test_out_2 = np.ones((1, 3, 3))

        out_1, out_2 = util.sort_point_cloud_xyz2(test_inp_1, test_inp_2)

        self.assertEqual(test_out_1, out_1)
        self.assertEqual(test_out_2, out_2)


if __name__ == '__main__':
    tf.test.main()
