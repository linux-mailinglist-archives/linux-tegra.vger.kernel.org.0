Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2B0EF75F57A
	for <lists+linux-tegra@lfdr.de>; Mon, 24 Jul 2023 13:52:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229727AbjGXLwK (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Mon, 24 Jul 2023 07:52:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34946 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229522AbjGXLwI (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 24 Jul 2023 07:52:08 -0400
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [IPv6:2001:4d48:ad52:32c8:5054:ff:fe00:142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF971E78;
        Mon, 24 Jul 2023 04:52:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
        MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=dFv08xg9HCEZeX/IpQAY/FCMvhcm28/wsJC6QmXws2U=; b=uRJfH/alHjeF7UV7W/ckiQtSyp
        PxbLh1ne240IwoAHSN9auV+gtuXp2WbQL+GuRh5mgZJfKJvr+MPkzQqSvAY4ox5H9GpE6Cp1+9fdW
        w+Yko2jULXDwFFOpNIClMFiZlUSgM5tBzoFJC8Kufgwxk8Xsww7HeHH4mDGAt0tVTc3ZRLYT3qktm
        Lu2YMmWNi7I8SBoK1C+29xAmHxgDJ8hQtnZT44f9/Qcrp66aN9MBfI/t1dgkOtPvjlbflAGkdZhw7
        Jkn+4r5ErKDUvcGUE9i3s1EmvUuMO2v2IjBlNgmhdXcE9/PbZNL72qrMF1OEFbUqNnL6CctLp/f6Z
        wtURIvsA==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:41896)
        by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.96)
        (envelope-from <linux@armlinux.org.uk>)
        id 1qNu6d-0008QN-0x;
        Mon, 24 Jul 2023 12:52:03 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
        (envelope-from <linux@shell.armlinux.org.uk>)
        id 1qNu6d-0000m0-Bq; Mon, 24 Jul 2023 12:52:03 +0100
Date:   Mon, 24 Jul 2023 12:52:03 +0100
From:   "Russell King (Oracle)" <linux@armlinux.org.uk>
To:     Revanth Kumar Uppala <ruppala@nvidia.com>
Cc:     Andrew Lunn <andrew@lunn.ch>,
        "hkallweit1@gmail.com" <hkallweit1@gmail.com>,
        "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
        "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
        Narayan Reddy <narayanr@nvidia.com>
Subject: Re: [PATCH 2/4] net: phy: aquantia: Enable MAC Controlled EEE
Message-ID: <ZL5l44e5cdODvwna@shell.armlinux.org.uk>
References: <20230628124326.55732-1-ruppala@nvidia.com>
 <20230628124326.55732-2-ruppala@nvidia.com>
 <57493101-413c-4f68-a064-f25e75fc2783@lunn.ch>
 <BL3PR12MB64504E1E36E01EF76ADB3946C302A@BL3PR12MB6450.namprd12.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <BL3PR12MB64504E1E36E01EF76ADB3946C302A@BL3PR12MB6450.namprd12.prod.outlook.com>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Mon, Jul 24, 2023 at 11:29:28AM +0000, Revanth Kumar Uppala wrote:
> > Ideally, you should only do SmartEEE, if the SoC MAC is dumb and does not have
> > EEE itself. I guess if you are doing rate adaptation, or MACSEC in the PHY, then
> > you might be forced to use SmartEEE since the SoC MAC is somewhat decoupled
> > from the PHY.
> > 
> > At the moment, we don't have a good story for SmartEEE. It should be
> > configured in the same way as normal EEE, ethtool --set-eee etc. I've got a
> > rewrite of normal EEE in the works. Once that is merged i hope SmartEEE will be
> > next.
> "ethtool --set-eee" is a dynamic way of enabling normal EEE and here we are doing the same normal EEE but configuring it by default in aqr107_config_init() instead of doing it dynamically.

So, setting the MAC_CNTRL_EEE bits is just enabling the standard IEEE
paths in the PHY to allow the IEEE defined EEE architecture to work?

If that's all its doing, I wonder why they aren't set by default...
seems rather strange.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
