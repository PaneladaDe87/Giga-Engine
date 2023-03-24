import lime.graphics.opengl.GL;

class Project {

    public function new() {
        // Initialize OpenGL ES 3.1
        var gl = GL.context;
        if (gl == null) {
            throw "OpenGL ES 3.1 not supported!";
        }

        // Set the clear color
        gl.clearColor(0.0, 0.0, 0.0, 1.0);

        // Enable depth testing
        gl.enable(GL.DEPTH_TEST);
        gl.depthFunc(GL.LEQUAL);

        // Set the viewport
        gl.viewport(0, 0, 640, 480);

        // Set up a simple vertex and fragment shader
        var vertexShaderSource = "#version 310 es\nlayout (location = 0) in vec3 aPosition;\nvoid main() {\n  gl_Position = vec4(aPosition, 1.0);\n}";
        var fragmentShaderSource = "#version 310 es\nprecision mediump float;\nout vec4 outColor;\nvoid main() {\n  outColor = vec4(1.0, 1.0, 1.0, 1.0);\n}";

        var vertexShader = gl.createShader(GL.VERTEX_SHADER);
        gl.shaderSource(vertexShader, vertexShaderSource);
        gl.compileShader(vertexShader);

        var fragmentShader = gl.createShader(GL.FRAGMENT_SHADER);
        gl.shaderSource(fragmentShader, fragmentShaderSource);
        gl.compileShader(fragmentShader);

        var program = gl.createProgram();
        gl.attachShader(program, vertexShader);
        gl.attachShader(program, fragmentShader);
        gl.linkProgram(program);

        // Render a triangle
        var vertices = [
            -0.5, -0.5, 0.0,
            0.5, -0.5, 0.0,
            0.0,  0.5, 0.0
        ];

        var vbo = gl.createBuffer();
        gl.bindBuffer(GL.ARRAY_BUFFER, vbo);
        gl.bufferData(GL.ARRAY_BUFFER, new Float32Array(vertices), GL.STATIC_DRAW);

        gl.useProgram(program);
        var positionLocation = gl.getAttribLocation(program, "aPosition");
        gl.enableVertexAttribArray(positionLocation);
        gl.vertexAttribPointer(positionLocation, 3, GL.FLOAT, false, 0, 0);

        gl.clear(GL.COLOR_BUFFER_BIT | GL.DEPTH_BUFFER_BIT);
        gl.drawArrays(GL.TRIANGLES, 0, 3);
    }
}

// Run the program
new MyOpenGLProgram();
