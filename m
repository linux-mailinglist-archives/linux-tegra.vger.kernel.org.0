Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 527CC48F1C
	for <lists+linux-tegra@lfdr.de>; Mon, 17 Jun 2019 21:30:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729039AbfFQTa3 (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Mon, 17 Jun 2019 15:30:29 -0400
Received: from mail.kernel.org ([198.145.29.99]:42826 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726818AbfFQTa2 (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 17 Jun 2019 15:30:28 -0400
Received: from localhost (unknown [69.71.4.100])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 12CD72085A;
        Mon, 17 Jun 2019 19:30:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1560799827;
        bh=EO3rndm1kizZKRRgaBQ2Ex0fqtnSxnV8aKb1wgimJO0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Y+uBBYIx/Lv0vOWz4/HM9ByP0SDV6Plv+2pMSzX0B1JtiPckLzoWIYN2EYCTMN5Cb
         Z4K0C9mj5oQ1J+1JH0AYyTOVaoJD50+X2BOlmeYmeQNK+WjLdgN+r2S1cdw+/KdsNu
         qi0P5GrA5Zy0kgdlUYzoc343k/yyzm0A8bRDxJYc=
Date:   Mon, 17 Jun 2019 14:30:24 -0500
From:   Bjorn Helgaas <helgaas@kernel.org>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Manikanta Maddireddy <mmaddireddy@nvidia.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        robh+dt@kernel.org, mark.rutland@arm.com, jonathanh@nvidia.com,
        vidyas@nvidia.com, linux-tegra@vger.kernel.org,
        linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org, "Rafael J. Wysocki" <rjw@rjwysocki.net>
Subject: Re: [PATCH V4 22/28] PCI: tegra: Access endpoint config only if PCIe
 link is up
Message-ID: <20190617193024.GC13533@google.com>
References: <20190516055307.25737-1-mmaddireddy@nvidia.com>
 <20190516055307.25737-23-mmaddireddy@nvidia.com>
 <20190604131436.GS16519@ulmo>
 <09bcc121-eaca-3866-d0ef-7806503e883f@nvidia.com>
 <ca34eb24-8696-576f-26bc-8d6141f81a41@nvidia.com>
 <20190613143946.GA30445@e121166-lin.cambridge.arm.com>
 <20190613154250.GA32713@ulmo>
 <a523a19c-fdfa-01f7-6f6d-2ca367a10a50@nvidia.com>
 <20190617114745.GL508@ulmo>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190617114745.GL508@ulmo>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

[+cc Rafael, linux-pm, in case they have insights on how rfkill works]

On Mon, Jun 17, 2019 at 01:47:45PM +0200, Thierry Reding wrote:
> On Mon, Jun 17, 2019 at 03:31:38PM +0530, Manikanta Maddireddy wrote:
> > On 13-Jun-19 9:12 PM, Thierry Reding wrote:
> > > On Thu, Jun 13, 2019 at 03:39:46PM +0100, Lorenzo Pieralisi wrote:
> > >> On Mon, Jun 10, 2019 at 10:08:16AM +0530, Manikanta Maddireddy wrote:
> > >>> On 04-Jun-19 7:40 PM, Manikanta Maddireddy wrote:
> > >>>> On 04-Jun-19 6:44 PM, Thierry Reding wrote:
> > >>>>> On Thu, May 16, 2019 at 11:23:01AM +0530, Manikanta Maddireddy wrote:
> > >>>>>> Few endpoints like Wi-Fi supports power on/off and to leverage that
> > >>>>>> root port must support hot-plug and hot-unplug. Tegra PCIe doesn't
> > >>>>>> support hot-plug and hot-unplug, however it supports endpoint power
> > >>>>>> on/off feature as follows,
> > >>>>>>  - Power off sequence:
> > >>>>>>    - Transition of PCIe link to L2
> > >>>>>>    - Power off endpoint
> > >>>>>>    - Leave root port in power up state with the link in L2
> > >>>>>>  - Power on sequence:
> > >>>>>>    - Power on endpoint
> > >>>>>>    - Apply hot reset to get PCIe link up
> > >>>>>>
> > >>>>>> PCIe client driver stops accessing PCIe endpoint config and
> > >>>>>> BAR registers after endpoint is powered off. However,
> > >>>>>> software applications like x11 server or lspci can access
> > >>>>>> endpoint config registers in which case host controller
> > >>>>>> raises "response decoding" errors. To avoid this scenario,
> > >>>>>> add PCIe link up check in config read and write callback
> > >>>>>> functions before accessing endpoint config registers.

> > >>>>>> Signed-off-by: Manikanta Maddireddy <mmaddireddy@nvidia.com>
> > >>>>>> ---
> > >>>>>> V4: No change
> > >>>>>>
> > >>>>>> V3: Update the commit log with explanation for the need of this patch
> > >>>>>>
> > >>>>>> V2: Change tegra_pcie_link_status() to tegra_pcie_link_up()
> > >>>>>>
> > >>>>>>  drivers/pci/controller/pci-tegra.c | 38 ++++++++++++++++++++++++++++++
> > >>>>>>  1 file changed, 38 insertions(+)

> > >>>>> This still doesn't look right to me conceptually. If
> > >>>>> somebody wants to access the PCI devices after the kernel
> > >>>>> has powered them off, why can't we just power the devices
> > >>>>> back on so that we allow userspace to properly access the
> > >>>>> devices?

> > >>>> 1. WiFi devices provides power-off feature for power saving
> > >>>> in mobiles.  When WiFi is turned off we shouldn't power on
> > >>>> the HW back without user turning it back on.

> > >>>> 2. When ever user process tries to access config space, it'll
> > >>>> end up in these functions. We cannot have is_powered_on check
> > >>>> in config read/write callbacks.

> > >>>> 3. WiFi power on/off is device specific feature, we shouldn't
> > >>>> handle it in PCI subsystem or host controller driver.

> > >>>>
> > >>>>> Or if that's not what we want, shouldn't we add something to
> > >>>>> the core PCI infrastructure to let us deal with this? It
> > >>>>> seems like this is some general problem that would apply to
> > >>>>> every PCI device and host bridge driver. Having each driver
> > >>>>> implement this logic separately doesn't seem like a good
> > >>>>> idea to me.

> > >>>> This should be handled by hotplug feature, whenever endpoint
> > >>>> is powered-off/ removed from the slot, hot unplug event
> > >>>> should take care of it. Unfortunately Tegra PCIe doesn't
> > >>>> support hotplug feature.

> > >>> I thought about your comment in
> > >>> https://patchwork.ozlabs.org/patch/1084204/ again.  What if I
> > >>> add link up check in tegra_pcie_isr() and make "response
> > >>> decoding error" as debug print? EP Config access will happen
> > >>> when link is down, but "Response decoding error" print comes
> > >>> only if debug log is enabled.  This way we can avoid race
> > >>> issue in config accessors and we get prints when debug logs
> > >>> are enabled.

> > > The problem that Manikanta is trying to solve here occurs in
> > > this situation (Manikanta, correct me if I've got this wrong):
> > > on some setups, a WiFi module connected over PCI will toggle a
> > > power GPIO as part of runtime suspend. This effectively causes
> > > the module to disappear from the PCI bus (i.e. it can no longer
> > > be accessed until the power GPIO is toggled again).
> > 
> > GPIO is toggled as part of WiFi on/off, can be triggered from
> > network manager UI.

> > > This is fine from a kernel point of view because the kernel keeps track
> > > of what devices are suspended. However, userspace will occasionally try
> > > to read the configuration space access of all devices, and since it
> > > doesn't have any knowledge about the suspend state of these devices, it
> > > doesn't know which ones to leave alone. I think this happens when the
> > > X.Org server is running.
> > 
> > This is fine from a kernel point of view because PCI client driver
> > doesn't initiate any PCIe transaction until network interface
> > is up during WiFi on.
> > 
> > > One thing that Manikanta and I had discussed was that perhaps
> > > the device should be hot-unplugged when it goes into this
> > > low-power state. However, we don't support hotplug on Tegra210
> > > where this is needed, so we'd need some sort of software-induced
> > > hot-unplug. However, this low power state is entered when the
> > > WiFi interface is taken down (i.e. ip link set dev <interface>
> > > down). If we were to remove the PCI device in that case, it
> > > means that the interface goes away completely, which is
> > > completely unexpected from a user's perspective. After all,
> > > taking a link down and up may be something that scripts are
> > > doing all the time. They'd fall over if after taking the
> > > interface down, the interface completely disappears.

> > > It's also not entirely clear to me how we get the device back
> > > onto the bus again after it is in low power. If we hot-unplug
> > > the device, then the driver will be unbound. Presumably the
> > > driver is what's controlling the power GPIO, so there won't be
> > > any entity that can be used to bring the chip back to life.
> > > Unless we deal with that power GPIO elsewhere (rfkill switch
> > > perhaps?).

> > Correct, rfkill switch should handle the GPIO.
> > Sequence will be,
> >  - WiFi ON
> >    - rfkill switch enables the WiFi GPIO
> >    - Tegra PCIe receives hot plug event
> >    - Tegra PCIe hot plug driver rescans PCI bus and enumerates the device
> >    - PCI client driver is probed, which will create network interface
> >  - WiFi OFF
> >    - rfkill switch disables the WiFi GPIO
> >    - Tegra PCIe receives hot unplug event
> >    - Tegra PCIe hot plug driver removes PCI devices under the bus
> >    - PCI client driver remove is executed, which will remove
> >      network interface

> > We don't need current patch in this case because PCI device is not
> > present in the PCI hierarchy, so there cannot be EP config access
> > with link down.  However Tegra doesn't support hot plug and unplug
> > events. I am not sure if we have any software based hot plug event
> > trigger.

> > I will drop current patch and pursue if above sequence can be
> > implemented for Tegra.
> 
> I just recalled that we have these messages in the kernel log:
> 
> 	# dmesg | grep tegra-pcie
> 	[    1.055761] tegra-pcie 1003000.pcie: 4x1, 1x1 configuration
> 	[    2.745764] tegra-pcie 1003000.pcie: 4x1, 1x1 configuration
> 	[    2.753073] tegra-pcie 1003000.pcie: probing port 0, using 4 lanes
> 	[    2.761334] tegra-pcie 1003000.pcie: Slot present pin change, signature: 00000008
> 	[    3.177607] tegra-pcie 1003000.pcie: link 0 down, retrying
> 	[    3.585605] tegra-pcie 1003000.pcie: link 0 down, retrying
> 	[    3.993606] tegra-pcie 1003000.pcie: link 0 down, retrying
> 	[    4.001214] tegra-pcie 1003000.pcie: link 0 down, ignoring
> 	[    4.006733] tegra-pcie 1003000.pcie: probing port 1, using 1 lanes
> 	[    4.015042] tegra-pcie 1003000.pcie: Slot present pin change, signature: 00000000
> 	[    4.031177] tegra-pcie 1003000.pcie: PCI host bridge to bus 0000:00
> 
> These "slot present pin change" message do look a lot like hotplug
> related messages. Could we perhaps use those to our advantage for this
> case? Do you see these when you run on the platform where WiFi is
> enabled/disabled using rfkill?
> 
> Given that rfkill is completely decoupled from PCI, I don't see how we
> would trigger any software-based hotplug mechanism. Perhaps one thing
> that we could do is the equivalent of this:
> 
> 	# echo 1 > /sys/bus/pci/rescan
> 
> from some script that's perhaps tied to the rfkill somehow. I'm not sure
> if that's possible, or generic enough.

How does rfkill work?  It sounds like it completely removes power from
the wifi device, putting it in D3cold.  Is there any software
notification other than the "Slot present pin change" (which looks
like a Tegra-specific thing)?

If the device is in D3cold, it won't respond to any PCI transactions,
and there's no standard PCI mechanism to wake it up.  Probably the
cleanest way to handle this is to make it a hot-unplug.

If this were an ACPI system, the rfkill might be visible as some sort
of ACPI power management event, and there might be a corresponding way
for software to bring the device back to D0 temporarily.  That would
make lspci and X config reads work.  But I don't think this system has
ACPI.

> > > Perhaps one other way to deal with this would be to track the
> > > suspend state of devices and then have the code that implements
> > > the PCI access from userspace refuse accesses to devices that
> > > are asleep. I suppose this is somewhat of an odd use-case
> > > because traditionally I guess PCI devices never power down to a
> > > state where their configuration space can no longer be accessed.
> > > At least that's what would explain why this has never been an
> > > issue before. Or perhaps it has?
> > >
> > > The last resort would be to just never put the WiFi chip into
> > > that low power mode, though I'm not exactly sure what that means
> > > for the power consumption on the affected systems.

> > >>>>>> diff --git a/drivers/pci/controller/pci-tegra.c b/drivers/pci/controller/pci-tegra.c
> > >>>>>> index d20c88a79e00..33f4dfab9e35 100644
> > >>>>>> --- a/drivers/pci/controller/pci-tegra.c
> > >>>>>> +++ b/drivers/pci/controller/pci-tegra.c
> > >>>>>> @@ -428,6 +428,14 @@ static inline u32 pads_readl(struct tegra_pcie *pcie, unsigned long offset)
> > >>>>>>  	return readl(pcie->pads + offset);
> > >>>>>>  }
> > >>>>>>  
> > >>>>>> +static bool tegra_pcie_link_up(struct tegra_pcie_port *port)
> > >>>>>> +{
> > >>>>>> +	u32 value;
> > >>>>>> +
> > >>>>>> +	value = readl(port->base + RP_LINK_CONTROL_STATUS);
> > >>>>>> +	return !!(value & RP_LINK_CONTROL_STATUS_DL_LINK_ACTIVE);
> > >>>>>> +}
> > >>>>>> +
> > >>>>>>  /*
> > >>>>>>   * The configuration space mapping on Tegra is somewhat similar to the ECAM
> > >>>>>>   * defined by PCIe. However it deviates a bit in how the 4 bits for extended
> > >>>>>> @@ -493,20 +501,50 @@ static void __iomem *tegra_pcie_map_bus(struct pci_bus *bus,
> > >>>>>>  static int tegra_pcie_config_read(struct pci_bus *bus, unsigned int devfn,
> > >>>>>>  				  int where, int size, u32 *value)
> > >>>>>>  {
> > >>>>>> +	struct tegra_pcie *pcie = bus->sysdata;
> > >>>>>> +	struct pci_dev *bridge;
> > >>>>>> +	struct tegra_pcie_port *port;
> > >>>>>> +
> > >>>>>>  	if (bus->number == 0)
> > >>>>>>  		return pci_generic_config_read32(bus, devfn, where, size,
> > >>>>>>  						 value);
> > >>>>>>  
> > >>>>>> +	bridge = pcie_find_root_port(bus->self);
> > >>>>>> +
> > >>>>>> +	list_for_each_entry(port, &pcie->ports, list)
> > >>>>>> +		if (port->index + 1 == PCI_SLOT(bridge->devfn))
> > >>>>>> +			break;
> > >>>>>> +
> > >>>>>> +	/* If there is no link, then there is no device */
> > >>>>>> +	if (!tegra_pcie_link_up(port)) {
> > >>>>>> +		*value = 0xffffffff;
> > >>>>>> +		return PCIBIOS_DEVICE_NOT_FOUND;
> > >>>>>> +	}
> > >>>>>> +
> > >>>>>>  	return pci_generic_config_read(bus, devfn, where, size, value);
> > >>>>>>  }
> > >>>>>>  
> > >>>>>>  static int tegra_pcie_config_write(struct pci_bus *bus, unsigned int devfn,
> > >>>>>>  				   int where, int size, u32 value)
> > >>>>>>  {
> > >>>>>> +	struct tegra_pcie *pcie = bus->sysdata;
> > >>>>>> +	struct tegra_pcie_port *port;
> > >>>>>> +	struct pci_dev *bridge;
> > >>>>>> +
> > >>>>>>  	if (bus->number == 0)
> > >>>>>>  		return pci_generic_config_write32(bus, devfn, where, size,
> > >>>>>>  						  value);
> > >>>>>>  
> > >>>>>> +	bridge = pcie_find_root_port(bus->self);
> > >>>>>> +
> > >>>>>> +	list_for_each_entry(port, &pcie->ports, list)
> > >>>>>> +		if (port->index + 1 == PCI_SLOT(bridge->devfn))
> > >>>>>> +			break;
> > >>>>>> +
> > >>>>>> +	/* If there is no link, then there is no device */
> > >>>>>> +	if (!tegra_pcie_link_up(port))
> > >>>>>> +		return PCIBIOS_DEVICE_NOT_FOUND;
> > >>>>>> +
> > >>>>>>  	return pci_generic_config_write(bus, devfn, where, size, value);
> > >>>>>>  }
> > >>>>>>  
> > >>>>>> -- 
> > >>>>>> 2.17.1
> > >>>>>>
> > 


