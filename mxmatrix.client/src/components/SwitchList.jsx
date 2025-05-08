import { useEffect, useState } from "react";

export default function SwitchList() {
    const [switches, setSwitches] = useState([]);

    useEffect(() => {
        fetch("/api/mxswitch") // calls your backend API
            .then(response => response.json())
            .then(data => {
                console.log(data)
                setSwitches(data)
            })
            .catch(error => console.error("Error fetching switches:", error));
    }, []);

    return (
        <div className="p-4">
            <h1 className="text-2xl font-bold mb-4">Switch List</h1>
            <ul className="list-disc list-inside">
                {switches.map(sw => (
                    <li key={sw.id}>{sw.name}</li>
                ))}
            </ul>
        </div>
    );
}
