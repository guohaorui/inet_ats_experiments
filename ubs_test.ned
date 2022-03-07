//
// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU Lesser General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
// 
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU Lesser General Public License for more details.
// 
// You should have received a copy of the GNU Lesser General Public License
// along with this program.  If not, see http://www.gnu.org/licenses/.
// 

package inet.networks.tsn;

import inet.networks.base.TsnNetworkBase;
import inet.node.contract.IEthernetNetworkNode;
import inet.node.ethernet.EthernetLink;
import inet.node.tsn.TsnDevice;
import inet.node.tsn.TsnSwitch;
network ubs_test extends TsnNetworkBase
{
    parameters:
        *.eth[*].bitrate = default(1Gbps);
    submodules:
        T0: TsnDevice{
            @display("p=350,200");
        }
        S0: TsnSwitch{
            @display("p=600,350");
        }
        L0: TsnDevice{
            @display("p=1100,350");
        }
        T1: TsnDevice{
            @display("p=350,300");
        }
        T2: TsnDevice{
            @display("p=350,400");
        }
        T3: TsnDevice{
            @display("p=350,500");
        }
        S1: TsnSwitch{
            @display("p=850,350");
        }
    connections:
        T0.ethg++ <--> EthernetLink <--> S0.ethg++;
        T1.ethg++ <--> EthernetLink <--> S0.ethg++;
        T2.ethg++ <--> EthernetLink <--> S0.ethg++;
        T3.ethg++ <--> EthernetLink <--> S0.ethg++;
        S1.ethg++ <--> EthernetLink <--> S0.ethg++;
        S1.ethg++ <--> EthernetLink <--> L0.ethg++;
}
