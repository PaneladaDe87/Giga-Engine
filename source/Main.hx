import openfl.display.Sprite;
import openfl.events.MouseEvent;

class Main extends Sprite {
    public function new() {
        super();
        
        // Crie um botão para cada projeto
        var project1Button = new ProjectButton("Projeto 1");
        project1Button.x = 10;
        project1Button.y = 10;
        project1Button.addEventListener(MouseEvent.CLICK, onProject1Click);
        addChild(project1Button);
        
        var project2Button = new ProjectButton("Projeto 2");
        project2Button.x = 10;
        project2Button.y = 50;
        project2Button.addEventListener(MouseEvent.CLICK, onProject2Click);
        addChild(project2Button);
        
        var project3Button = new ProjectButton("Projeto 3");
        project3Button.x = 10;
        project3Button.y = 90;
        project3Button.addEventListener(MouseEvent.CLICK, onProject3Click);
        addChild(project3Button);
    }
    
    private function onProject1Click(event:MouseEvent):Void {
        trace("Projeto 1 selecionado!");
        // Adicione o código para abrir o Projeto 1 aqui
    }
    
    private function onProject2Click(event:MouseEvent):Void {
        trace("Projeto 2 selecionado!");
        // Adicione o código para abrir o Projeto 2 aqui
    }
    
    private function onProject3Click(event:MouseEvent):Void {
        trace("Projeto 3 selecionado!");
        // Adicione o código para abrir o Projeto 3 aqui
    }
}

class ProjectButton extends Sprite {
    public function new(projectName:String) {
        super();
        graphics.beginFill(0xDDDDDD);
        graphics.drawRect(0, 0, 200, 30);
        graphics.endFill();
        
        var label = new TextField();
        label.text = projectName;
        label.x = 10;
        label.y = 5;
        addChild(label);
    }
}
