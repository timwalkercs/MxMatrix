import { Link } from 'react-router-dom';
import './Footer.css';

function Footer() {

    return (
        <div className="foot-wrapper">

            <div className="leftcol">
                <h5>NAVIGATION</h5>
                <Link to={`/gallery/`}>
                    <p className="footer-links">Gallery</p>
                </Link>
                <Link to={`/learnmore/`}>
                    <p className="footer-links">Learn More</p>
                </Link>
                <Link to={`/`}>
                    <p className="footer-links">Home</p>
                </Link>
            </div>

            <div className="midcol">
                <h5>DEVELOPMENT</h5>
                <a href="https://github.com/timwalkercs/MxMatrix" target="_blank" rel="noopener noreferrer" className="footer-links">GitHub Repo</a>

            </div>

            <div className="rightcol">

            </div>

        </div>
    );
}

export default Footer;