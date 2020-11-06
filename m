Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E68582A9AA7
	for <lists+linux-tegra@lfdr.de>; Fri,  6 Nov 2020 18:18:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727645AbgKFRSr (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Fri, 6 Nov 2020 12:18:47 -0500
Received: from hqnvemgate24.nvidia.com ([216.228.121.143]:1566 "EHLO
        hqnvemgate24.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727287AbgKFRSq (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Fri, 6 Nov 2020 12:18:46 -0500
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate24.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
        id <B5fa585790000>; Fri, 06 Nov 2020 09:18:49 -0800
Received: from [10.2.59.206] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 6 Nov
 2020 17:18:45 +0000
Subject: Re: [PATCH v1 1/4] dt-bindings: ata: tegra: Convert binding
 documentation to YAML
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
To:     Rob Herring <robh@kernel.org>
CC:     <thierry.reding@gmail.com>, <linux-kernel@vger.kernel.org>,
        <robh+dt@kernel.org>, <linux-tegra@vger.kernel.org>,
        <linux-ide@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <jonathanh@nvidia.com>
References: <1604628968-1501-1-git-send-email-skomatineni@nvidia.com>
 <1604628968-1501-2-git-send-email-skomatineni@nvidia.com>
 <20201106161122.GB3289870@bogus>
 <f8ba33f1-90fa-a9f0-5834-9de23fc8ad31@nvidia.com>
Message-ID: <d0a42b1c-8ddc-fc97-c675-70a5b7601580@nvidia.com>
Date:   Fri, 6 Nov 2020 09:18:46 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <f8ba33f1-90fa-a9f0-5834-9de23fc8ad31@nvidia.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1604683129; bh=VWIsRcQDKDV7PcpK5vBAO2Hxh55PFI5xtcXzYtDOamU=;
        h=Subject:From:To:CC:References:Message-ID:Date:User-Agent:
         MIME-Version:In-Reply-To:Content-Type:Content-Transfer-Encoding:
         Content-Language:X-Originating-IP:X-ClientProxiedBy;
        b=LTmAX2qSsrtYTYs6gZIzVcgARkmnr0MYd66B/PoRgDLeRM5BgMSKBc6pGTC6oEc3X
         9ElOaeZA+H5k/KoGZKKsm+2In7YdSoNefHFMWp57ghISbvgKILOfi1VdhaRwkmL4hA
         H1alqJIjcnmg7LqG85wK8LRgnafgefJR4DZTUX+PbtnVB6iuV5ouPiX2OzSeAmhNoB
         vFG0dkgmhIB9aMaokQCPB+2x9qSETZlcAC1BeKpbGp2uLgoU1CaUYlRIiuiiSuHfd+
         uMGpke8O+vtt6hhRfuSzDfvAyyRf8k7ahU4DH5fCXjevAbQcZ0IBK47NwBGp3OIkq3
         YfMyGj6KfSGLg==
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


On 11/6/20 8:41 AM, Sowjanya Komatineni wrote:
>
> On 11/6/20 8:11 AM, Rob Herring wrote:
>> On Thu, 05 Nov 2020 18:16:05 -0800, Sowjanya Komatineni wrote:
>>> This patch converts text based dt-binding document to YAML based
>>> dt-binding document.
>>>
>>> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
>>> ---
>>> =C2=A0 .../devicetree/bindings/ata/nvidia,tegra-ahci.yaml | 152=20
>>> +++++++++++++++++++++
>>> =C2=A0 .../bindings/ata/nvidia,tegra124-ahci.txt=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 44 ------
>>> =C2=A0 2 files changed, 152 insertions(+), 44 deletions(-)
>>> =C2=A0 create mode 100644=20
>>> Documentation/devicetree/bindings/ata/nvidia,tegra-ahci.yaml
>>> =C2=A0 delete mode 100644=20
>>> Documentation/devicetree/bindings/ata/nvidia,tegra124-ahci.txt
>>>
>>
>> My bot found errors running 'make dt_binding_check' on your patch:
>>
>> yamllint warnings/errors:
>>
>> dtschema/dtc warnings/errors:
>> Error:=20
>> Documentation/devicetree/bindings/ata/nvidia,tegra-ahci.example.dts:27.3=
1-32=20
>> syntax error
>> FATAL ERROR: Unable to parse input tree
>> make[1]: *** [scripts/Makefile.lib:342:=20
>> Documentation/devicetree/bindings/ata/nvidia,tegra-ahci.example.dt.yaml]=
=20
>> Error 1
>> make[1]: *** Waiting for unfinished jobs....
>> make: *** [Makefile:1364: dt_binding_check] Error 2
>>
>>
>> See https://patchwork.ozlabs.org/patch/1395390
>>
>> The base for the patch is generally the last rc1. Any dependencies
>> should be noted.
>>
>> If you already ran 'make dt_binding_check' and didn't see the above
>> error(s), then make sure 'yamllint' is installed and dt-schema is up to
>> date:
>>
>> pip3 install dtschema --upgrade
>>
>> Please check and re-submit.
> Thanks Rob. Will re-try after installing up-to-date.

Somehow running 'make dt_binding_check' gives below error.

I have yamllint newest version (1.2.1-1). Any specific version of=20
yamllint is needed?

 =C2=A0LINT=C2=A0=C2=A0=C2=A0 Documentation/devicetree/bindings
invalid config: unknown option "max-spaces-inside-empty" for rule "braces"
xargs: /usr/bin/yamllint: exited with status 255; aborting
Documentation/devicetree/bindings/Makefile:59: recipe for target=20
'Documentation/devicetree/bindings/processed-schema-examples.json' failed
make[1]: ***=20
[Documentation/devicetree/bindings/processed-schema-examples.json] Error 12=
4
Makefile:1362: recipe for target 'dt_binding_check' failed
make: *** [dt_binding_check] Error 2

