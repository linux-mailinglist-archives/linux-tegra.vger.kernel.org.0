Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E3B09285923
	for <lists+linux-tegra@lfdr.de>; Wed,  7 Oct 2020 09:14:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727708AbgJGHOB (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Wed, 7 Oct 2020 03:14:01 -0400
Received: from hqnvemgate25.nvidia.com ([216.228.121.64]:5971 "EHLO
        hqnvemgate25.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727599AbgJGHOA (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Wed, 7 Oct 2020 03:14:00 -0400
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate25.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
        id <B5f7d6a810001>; Wed, 07 Oct 2020 00:13:05 -0700
Received: from [10.25.101.204] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 7 Oct
 2020 07:13:53 +0000
Subject: Re: [PATCH v3 09/13] ASoC: dt-bindings: tegra: Add schema for audio
 graph card
To:     Rob Herring <robh@kernel.org>
CC:     <broonie@kernel.org>, <lgirdwood@gmail.com>,
        <kuninori.morimoto.gx@renesas.com>,
        <pierre-louis.bossart@linux.intel.com>, <perex@perex.cz>,
        <tiwai@suse.com>, <thierry.reding@gmail.com>,
        <jonathanh@nvidia.com>, <alsa-devel@alsa-project.org>,
        <devicetree@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <sharadg@nvidia.com>,
        <mkumard@nvidia.com>, <viswanathl@nvidia.com>,
        <rlokhande@nvidia.com>, <dramesh@nvidia.com>,
        <atalambedu@nvidia.com>, <nwartikar@nvidia.com>,
        <swarren@nvidia.com>, <nicoleotsuka@gmail.com>
References: <1601573587-15288-1-git-send-email-spujar@nvidia.com>
 <1601573587-15288-10-git-send-email-spujar@nvidia.com>
 <20201006203433.GA2786434@bogus>
From:   Sameer Pujar <spujar@nvidia.com>
Message-ID: <a5bc07d8-fb2e-e86e-f0d3-be19166ad7bb@nvidia.com>
Date:   Wed, 7 Oct 2020 12:43:50 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201006203433.GA2786434@bogus>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 HQMAIL107.nvidia.com (172.20.187.13)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1602054785; bh=/ogdgdqjxjkT33GrVdiECGAlj2ugqSEXgT8/zYZImUA=;
        h=Subject:To:CC:References:From:Message-ID:Date:User-Agent:
         MIME-Version:In-Reply-To:Content-Type:Content-Transfer-Encoding:
         Content-Language:X-Originating-IP:X-ClientProxiedBy;
        b=XtU5tYzm3GfSAkuTvH6PQaSeYmYjAL/rAufBtULI6I/l1BCpFnrNWb/u2GuIbET8t
         i9+b6WyIVw6t7dplUat1O/UItoSMD+DLVdQpI/cO+KuU/hnS/2S5nBq68dA2uta/88
         EFJ7am0x2CxfeZL6GidrchQR7m+aunCB5+y8/ks4sh/U5cMdr7333eVaUndl7oPAeW
         UXfO6g2OvKhr0dMtWH2w7yvC1UzE/E72L4Le8CnulD1cPXxUlLQR4Lt6S9tZclsBUZ
         jaix0aRqcfKO+B0Koj1B02Wb6SmWrQin/EkmitiWvaH1osQU03KklCXK3vKK6NA+Qq
         zglpDOr/HxZMA==
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


>> Add YAML schema for Tegra audio graph sound card DT bindings. It uses the
>> same DT bindings provided by generic audio graph driver. Along with this
>> few standard clock DT bindings are added which are specifically required
>> for Tegra audio.
>>
>> Signed-off-by: Sameer Pujar <spujar@nvidia.com>
>> ---
>>   .../sound/nvidia,tegra-audio-graph-card.yaml       | 70 ++++++++++++++++++++++
>>   1 file changed, 70 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra-audio-graph-card.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/sound/nvidia,tegra-audio-graph-card.yaml b/Documentation/devicetree/bindings/sound/nvidia,tegra-audio-graph-card.yaml
>> new file mode 100644
>> index 0000000..b73fbe5
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/sound/nvidia,tegra-audio-graph-card.yaml
>> @@ -0,0 +1,70 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/sound/nvidia,tegra-audio-graph-card.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Audio Graph based Tegra sound card driver
>> +
>> +description: |
>> +  This is based on generic audio graph card driver along with additional
>> +  customizations for Tegra platforms. It uses the same bindings with
>> +  additional standard clock DT bindings required for Tegra.
>> +
>> +  See{LINUX}/Documentation/devicetree/bindings/sound/audio-graph-card.txt
>> +
>> +maintainers:
>> +  - Jon Hunter <jonathanh@nvidia.com>
>> +  - Sameer Pujar <spujar@nvidia.com>
>> +
>> +properties:
>> +  compatible:
>> +    oneOf:
>> +      - const: nvidia,tegra210-audio-graph-card
>> +      - const: nvidia,tegra186-audio-graph-card
>> +
>> +  clocks:
>> +   minItems: 2
>> +
>> +  clock-names:
>> +   minItems: 2
>> +   items:
>> +     - const: pll_a
>> +     - const: plla_out0
>> +
>> +  assigned-clocks:
>> +    minItems: 1
>> +    maxItems: 3
>> +
>> +  assigned-clock-parents:
>> +    minItems: 1
>> +    maxItems: 3
>> +
>> +  assigned-clock-rates:
>> +    minItems: 1
>> +    maxItems: 3
>> +
>> +required:
>> +  - compatible
>> +  - clocks
>> +  - clock-names
>> +  - assigned-clocks
>> +  - assigned-clock-parents
> Where's the graph? You need to define the ports and reference the common
> schema.

I am looking to reference the bindings used in below doc which is not 
yet in YAML format. Only additional properties I listed here.
{LINUX}/Documentation/devicetree/bindings/sound/audio-graph-card.txt

Should I keep this doc to *.txt format as well and later move to YAML or 
is there a way to reference *.txt doc here?

