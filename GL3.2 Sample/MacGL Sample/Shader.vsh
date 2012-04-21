#version 150

in vec4 position;
in vec3 normal;
in vec2 texUV;

out vec3 colorVarying;
out vec2 texUVVarying;

uniform mat4 modelMatrix;
uniform mat4 modelViewProjectionMatrix;
uniform mat3 normalMatrix;
uniform vec3 lightVec;

void main()
{
    vec3 diffuseColor = vec3(1.0, 1.0, 1.0);
    vec3 ambientColor = vec3(0.3, 0.2, 0.1);
    vec3 theNormal = mat3(modelMatrix) * normal;

    float nDotVP = max(0.0, dot(theNormal, normalize(-lightVec)));

    colorVarying = diffuseColor * nDotVP + ambientColor;

    gl_Position = modelViewProjectionMatrix * position;
    texUVVarying = texUV;
}
